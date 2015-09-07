module CandidateMatcher
  extend ActiveSupport::Concern

  def matches
    all_matches = Candidate.where(gender: Candidate::GENDER.all_codes - [self.gender])

    scored_matches = []
    all_matches.each do |match|
      scored_matches.push({candidate: match, match_score: match_score(match)})
    end

    scored_matches.sort_by!{|match| match[:match_score]}
    return scored_matches.collect!{|match| match[:candidate]}.reverse!
  end

private
  # Calculates and returns the match score between +self+ and +match+
  def match_score(match)
    score = 0
    [:caste, :height, :complexion, :age].each do |pref|
      score += self.send(pref.to_s + "_score", match)
    end
    
    return score
  end

  def search_preference
    @search_preference ||= self.user.user_search_preference
  end

  def caste_score(match)
    return 0 if match.caste.nil?
    return 0 if search_preference.caste_pref_wt == UserSearchPreference::Weights::DONT_CARE
    score = 0
    if (self.caste == match.caste)
      if (self.subcaste == match.subcaste)
        score += 1
      else
        score += 0.5
      end
    end
    score *= search_preference.caste_pref_wt
    return score
  end

  def height_score(match)
    return 0 if match.height.nil?
    return 0 if search_preference.height_pref_wt == UserSearchPreference::Weights::DONT_CARE
    min_height = search_preference.height_pref_min || -1
    max_height = search_preference.height_pref_max || 215
    actual_height = match.height
    score = 1
    if actual_height >= max_height || actual_height <= min_height
      diffs = [(max_height - actual_height).abs, (min_height - actual_height).abs].sort
      score -= (1.0*diffs[0]/diffs[1])  
    end

    score *= search_preference.height_pref_wt

    return score
  end

  def complexion_score(match)
    return 0 if match.complexion.nil?
    return 0 if search_preference.complexion_pref_wt == UserSearchPreference::Weights::DONT_CARE    
    score = 1
    score -= (((match.complexion - search_preference.complexion_pref).abs)/(Candidate::COMPLEXION.all_codes.last - Candidate::COMPLEXION.all_codes.first))

    score *= search_preference.complexion_pref_wt
    return score
  end

  def age_score(match)
    return 0 if match.birthday.nil?
    return 0 if search_preference.age_pref_wt == UserSearchPreference::Weights::DONT_CARE
    min_age = search_preference.age_pref_min
    max_age = search_preference.age_pref_max
    actual_age = match.age_in_years
    score = 1
    if actual_age >= max_age || actual_age <= min_age
      diffs = [(max_age - actual_age).abs, (min_age - actual_age).abs].sort
      score -= (1.0*diffs[0]/diffs[1])  
    end

    score *= search_preference.age_pref_wt

    return score
  end
end