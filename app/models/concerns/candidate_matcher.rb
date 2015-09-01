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

    score = (match.id*5) % 7
    
    return score
  end
end