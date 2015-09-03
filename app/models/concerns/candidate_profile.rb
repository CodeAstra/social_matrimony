module CandidateProfile
  extend ActiveSupport::Concern
  include ActiveModel::Validations

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

  GENDER = ProfileInfoValues.new([
    [:male, 1, "Male"],
    [:female, 2, "Female"]
  ])

  MARITAL_STATUS =  ProfileInfoValues.new([
    [:never_married, 0, "Never Married"],
    [:divorced,      1, "Divorced"],
    [:widower,       2, "Widower"]
  ])
  BODY_TYPE = ProfileInfoValues.new([
    [:slim,     0, "Slim"],
    [:athletic, 1, "Athletic"],
    [:heavy,    2, "Heavy"]
  ])
  COMPLEXION = ProfileInfoValues.new([
    [:fair,     0, "Fair"],
    [:wheatish, 1, "wheatish"],
    [:dark,     2, "Dark"]
  ])
  PHYSICAL_STATUS = ProfileInfoValues.new([
    [:physical_disability, 0, "Physical Disability"],
    [:normal,              1, "normal"]
  ])
  FOOD_HABITS = ProfileInfoValues.new([
    [:vegan,          0, "Vegan"],
    [:Vegetarian,     1, "Vegetarian"],
    [:non_vegetarian, 2, "Non Vegetarian"]
  ])
  SMOKING = ProfileInfoValues.new([
    [:yes,          0, "Yes"],
    [:no,           1, "No"],
    [:ocassionally, 2, "Ocassionally"]
  ])
  DRINKING = ProfileInfoValues.new([
    [:yes,          0, "Yes"],
    [:no,           1, "No"],
    [:ocassionally, 2, "Ocassionally"]
  ])
  DOSHAM = ProfileInfoValues.new([
    [:yes,  0, "Yes"],
    [:no,   1, "No"]
  ])
  FAMILY_TYPE = ProfileInfoValues.new([
    [:joint,    0, "Joint"],
    [:nuclear,  1, "Nuclear"]
  ])
  FAMILY_VALUES = ProfileInfoValues.new([
    [:orthodox,    0, "Orthodox"],
    [:traditional, 1, "Traditional"],
    [:moderate,    2, "Moderate"],
    [:liberal,     3, "Liberal"]
  ])
  FAMILY_STATUS = ProfileInfoValues.new([
    [:middle_class,       0, "Middle Class"],
    [:upper_middle_class, 1, "Upper Middle Class"],
    [:rich,               2, "Rich"],
    [:affluent,           3, "Affluent"]
  ])

  included do
    validates :gender,         numericality: true, inclusion: GENDER.all_codes,         allow_nil: true
    validates :marital_status, numericality: true, inclusion: MARITAL_STATUS.all_codes, allow_nil: true
    validates :body_type,      numericality: true, inclusion: BODY_TYPE.all_codes,      allow_nil: true
    validates :complexion,     numericality: true, inclusion: COMPLEXION.all_codes,     allow_nil: true
    validates :physical_status,numericality: true, inclusion: PHYSICAL_STATUS.all_codes,allow_nil: true
    validates :food_habits,    numericality: true, inclusion: FOOD_HABITS.all_codes,    allow_nil: true
    validates :smoking,        numericality: true, inclusion: SMOKING.all_codes,        allow_nil: true
    validates :drinking,       numericality: true, inclusion: DRINKING.all_codes,       allow_nil: true
    # validates :dosham,         numericality: false, inclusion: DOSHAM.all_codes,         allow_nil: true
    validates :family_type,    numericality: true, inclusion: FAMILY_TYPE.all_codes,    allow_nil: true
    validates :family_values,  numericality: true, inclusion: FAMILY_VALUES.all_codes,  allow_nil: true
    validates :family_status,  numericality: true, inclusion: FAMILY_STATUS.all_codes,  allow_nil: true
    validates :height,         numericality: true, allow_nil: true
    validates :weight,         numericality: true, allow_nil: true
    validates :salary,         numericality: false, allow_nil: true
    validates :star,           numericality: false, allow_nil: true
    validates :rashi,          numericality: false, allow_nil: true
  end

end