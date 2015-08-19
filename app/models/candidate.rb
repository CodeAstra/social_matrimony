# == Schema Information
#
# Table name: candidates
#
#  id           :integer          not null, primary key
#  name         :string
#  email        :string
#  gender       :string
#  birthday     :date
#  hometown     :string
#  location     :string
#  image        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :integer
#  dump_fb_data :text
#

class Candidate < ActiveRecord::Base
  belongs_to :user

  def populate!
    fb_data = user.fb_profile
    self.dump_fb_data = Marshal.dump(fb_data)
    [:name, :email, :gender, :birthday, :hometown, :location].each do |prop|
      self.send(prop.to_s + "=", fb_data[prop.to_s]) if fb_data[prop.to_s]
    end
    # self.email = education_from_dump_data
    self.save!
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

    return edu.inspect
  end
end
