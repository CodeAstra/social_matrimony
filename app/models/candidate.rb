# == Schema Information
#
# Table name: candidates
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  gender          :integer
#  birthday        :date
#  hometown        :string
#  location        :string
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#  dump_fb_data    :text
#  education       :text
#  work            :text
#  marital_status  :integer
#  caste           :integer
#  sub_caste       :integer
#  gothram         :string
#  height          :integer
#  weight          :integer
#  body_type       :integer
#  complexion      :integer
#  physical_status :integer
#  salary          :integer
#  dosham          :integer
#  star            :integer
#  rashi           :integer
#  food_habits     :integer
#  smoking         :integer
#  drinking        :integer
#  family_type     :integer
#  family_values   :integer
#  family_status   :integer
#  mother_tongue   :integer
#  religion        :integer
#

class Candidate < ActiveRecord::Base
  include CandidateProfile
  include CandidateMatcher


  belongs_to :user
  belongs_to :caste
  belongs_to :sub_caste
  
  def populate!
    fb_data = user.fb_profile
    self.dump_fb_data = Marshal.dump(fb_data)
    [:name, :email, :image].each do |prop|
      self.send(prop.to_s + "=", fb_data[prop.to_s]) if fb_data[prop.to_s]
    end
    if fb_data["gender"] == "male"
      self.gender = GENDER.code_of(:male)
    elsif fb_data["gender"] == "female"
      self.gender = GENDER.code_of(:female)
    end
    [:hometown, :location].each do |prop|
      self.send(prop.to_s + "=", fb_data[prop.to_s]["name"]) if fb_data[prop.to_s]
    end

    self.birthday = Date.strptime(fb_data["birthday"],"%m/%d/%Y") if fb_data["birthday"]
    self.work = work_from_dump_data
    self.education = education_from_dump_data
    self.save!
  end

  def age_in_years
    ((Time.now - self.birthday.to_time)/(365*86400)).to_i
  end

private
  def education_from_dump_data
    fb_data = Marshal.load(self.dump_fb_data)
    edu = fb_data["education"]
    edu = edu.select do |ed|
      ["College", "Graduate School"].include?(ed["type"])
    end
    edu = edu.collect do |ed|
      arr = []
      arr.push(ed["school"]["name"])
      if ed["year"]
        arr.push(ed["year"]["name"])
      else
        arr.push(nil)
      end
      if ed["concentration"]
        arr.push(ed["concentration"].collect{|con| con["name"]}.join(", "))
      else
        arr.push(nil)
      end
      arr
    end

    return Marshal.dump(edu)
  end
end


def work_from_dump_data
  fb_data = Marshal.load(self.dump_fb_data)
  prof = fb_data["work"]
  prof = prof.collect do |wrk|
          wrk["employer"]["name"]
         end if prof
  return Marshal.dump(prof)

end
