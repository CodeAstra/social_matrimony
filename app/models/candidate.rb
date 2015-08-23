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
#  subcaste        :integer
#  gothram         :string
#  height          :string
#  weight          :string
#  body_type       :integer
#  complexion      :integer
#  physical_status :integer
#  salary          :string
#  food            :integer
#  smoke           :integer
#  drink           :integer
#  dosham          :integer
#  star            :string
#  rashi           :string
#  family_type     :integer
#  family_values   :integer
#  family_status   :integer
#

class Candidate < ActiveRecord::Base
  class ProfileInfoValues
    def initialize(vals)
      @vals = vals
    end

    # Returns the code of a property.
    # +prop+ is a symbol.
    # Eg: `MARITAL_STATUS.code_of(:never_married)`
    def code_of(prop)
      @vals.select{|val| val[0] == prop}[0][1]
    end

    def all_codes
      @vals.collect{|val| val[1]}
    end

    def all
      @vals.collect do |val|
        OpenStruct.new(code: val[1], title: val[2])
      end
    end
  end

  MARITAL_STATUS =  ProfileInfoValues.new([
    [:never_married, 0, "Never Married"],
    [:divorced,      1, "Divorced"],
    [:widower,       2, "Widower"]
  ])
  BODY_TYPE = ProfileInfoValues.new([
    [:slim, 0, "Slim"],
    [:athletic, 1, "Athletic"],
    [:heavy, 2,"Heavy"]
  ])
  COMPLEXION = ProfileInfoValues.new([
    [:fair, 0, "Fair"],
    [:wheatish, 1,"wheatish"],
    [:dark, 2, "Dark"]
  ])
  PHYSICAL_STATUS = ProfileInfoValues.new([
    [:physical_disability, 0, "Physical Disability"],
    [:normal, 1, "normal"]
  ])
  FOOD = ProfileInfoValues.new([
    [:vegan, 0, "Vegan"],
    [:Vegetarian, 1, "Vegetarian"],
    [:non_vegetarian, 2, "Non Vegetarian"]
  ])
  SMOKE = ProfileInfoValues.new([
    [:yes, 0, "Yes"],
    [:no, 1, "No"],
    [:ocassionally, 2, "Ocassionally"]
  ])
  DRINK = ProfileInfoValues.new([
    [:yes, 0, "Yes"],
    [:no, 1, "No"],
    [:ocassionally, 2, "Ocassionally"]
  ])
  DOSHAM = ProfileInfoValues.new([
    [:yes, 0, "Yes"],
    [:no, 1, "No"]
  ])
  FAMILY_TYPE = ProfileInfoValues.new([
    [:joint, 0, "Joint"],
    [:nuclear, 1, "Nuclear"]
  ])
  FAMILY_VALUES = ProfileInfoValues.new([
    [:orthodox, 0, "Orthodox"],
    [:traditional, 1, "Traditional"],
    [:moderate, 2, "Moderate"],
    [:liberal, 3, "Liberal"]
  ])
  FAMILY_STATUS = ProfileInfoValues.new([
    [:middle_class, 0, "Middle Class"],
    [:upper_middle_class, 1, "Upper Middle Class"],
    [:rich, 2, "Rich"],
    [:affluent, 3, "Affluent"]
  ])

  belongs_to :user

  validates :marital_status, numericality: true, inclusion: MARITAL_STATUS.all_codes, allow_nil: true
  validates :body_type, numericality: true, inclusion: BODY_TYPE.all_codes, allow_nil: true
  validates :complexion, numericality: true, inclusion: COMPLEXION.all_codes, allow_nil: true
  validates :physical_status, numericality: true, inclusion: PHYSICAL_STATUS.all_codes, allow_nil: true
  validates :food, numericality: true, inclusion: FOOD.all_codes, allow_nil: true
  validates :smoke, numericality: true, inclusion: SMOKE.all_codes, allow_nil: true
  validates :drink, numericality: true, inclusion: DRINK.all_codes, allow_nil: true
  validates :dosham, numericality: true, inclusion: DOSHAM.all_codes, allow_nil: true
  validates :family_type, numericality: true, inclusion: FAMILY_TYPE.all_codes, allow_nil: true
  validates :family_values, numericality: true, inclusion: FAMILY_VALUES.all_codes, allow_nil: true
  validates :family_status, numericality: true, inclusion: FAMILY_STATUS.all_codes, allow_nil: true

  def populate!
    fb_data = user.fb_profile
    self.dump_fb_data = Marshal.dump(fb_data)
    [:name, :email, :gender].each do |prop|
      self.send(prop.to_s + "=", fb_data[prop.to_s]) if fb_data[prop.to_s]
    end
    [:hometown, :location].each do |prop|
      self.send(prop.to_s + "=", fb_data[prop.to_s]["name"]) if fb_data[prop.to_s]
    end
    self.birthday = Date.strptime(fb_data["birthday"],"%m/%d/%Y") if fb_data["birthday"]
    self.work = work_from_dump_data
    self.education = education_from_dump_data
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


def work_from_dump_data
  fb_data = Marshal.load(self.dump_fb_data)
  prof = fb_data["work"]
  prof = prof.collect do |wrk|
          wrk["employer"]["name"]
         end if prof
  return Marshal.dump(prof)

end
