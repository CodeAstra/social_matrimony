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

    def title_from_code(code)
      @vals.select{|val| val[1] == code}[0][2]   
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
    [:male,   1, "Male"],
    [:female, 2, "Female"]
  ])

  MARITAL_STATUS =  ProfileInfoValues.new([
    [:never_married, 1, "Never Married"],
    [:divorced,      2, "Divorced"],
    [:widower,       3, "Widower"]
  ])

  MOTHER_TONGUE = ProfileInfoValues.new([
    [:angika ,       1,  "Angika " ],
    [:arunachali,    2,  "Arunachali" ],
    [:assamese,      3,  "Assamese"],
    [:awadhi,        4,  "Awadhi" ],
    [:bengali,       5,  "Bengali" ],
    [:bhojpuri,      6,  "Bhojpuri" ],
    [:brij,          7,  "Brij" ],
    [:bihari,        8,  "Bihari" ],
    [:badaga,        9,  "Badaga" ],
    [:chatisgarhi,  10,  "Chatisgarhi" ],
    [:dogri,        11,  "Dogri" ],
    [:english,      12,  "English" ],
    [:french,       13,  "French" ],
    [:garhwali,     14,  "Garhwali" ],
    [:garo,         15,  "Garo"],
    [:gujarati,     16,  "Gujarati" ],
    [:haryanvi,     17,  "Haryanvi" ], 
    [:himachali,    18,  "Himachali/Pahari" ],
    [:hindi,        19,  "Hindi" ],
    [:kanauji,      20,  "Kanauji" ],
    [:kannada,      21,  "Kannada" ],
    [:kashmiri,     22,  "Kashmiri" ],
    [:khandesi,     23,  "Khandesi" ],
    [:khasi,        24,  "Khasi" ],
    [:konkani,      25,  "Konkani" ],
    [:koshali,      26,  "Koshali" ],
    [:kumoani,      27,  "Kumoani"],
    [:kutchi ,      28,  "Kutchi " ],
    [:lepcha,       29,  "Lepcha" ],
    [:ladacki,      30,  "Ladacki"],
    [:magahi,       31,  "Magahi" ],
    [:maithili,     32,  "Maithili" ],
    [:malayalam,    33,  "Malayalam" ],
    [:manipuri,     34,  "Manipuri" ],
    [:marathi,      35,  "Marathi" ],
    [:marwari,      36,  "Marwari" ],
    [:miji,         37,  "Miji" ],
    [:mizo,         38,  "Mizo" ],
    [:monpa,        39,  "Monpa" ],
    [:nicobarese,   40,  "Nicobarese" ],
    [:nepali,       41,  "Nepali" ],
    [:oriya,        42,  "Oriya"],
    [:punjabi,      43,  "Punjabi" ],
    [:rajasthani,   44,  "Rajasthani" ], 
    [:sanskrit,     45,  "Sanskrit" ],
    [:santhali,     46,  "Santhali" ],
    [:sindhi,       47,  "Sindhi" ],
    [:sourashtra,   48,  "Sourashtra" ],
    [:tamil,        49,  "Tamil" ],
    [:telugu,       50,  "Telugu" ],
    [:tripuri,      51,  "Tripuri" ],
    [:tulu,         52,  "Tulu" ],
    [:urdu,         53,  "Urdu" ]
  ])

  RELIGION = ProfileInfoValues.new([
    [:hindu ,               1,  "Hindu " ],
    [:muslim_shia,          2,  "Muslim - Shia" ],
    [:muslim_sunni,         3,  "Muslim - Sunni"],
    [:muslim_others,        4,  "Muslim - Others" ],
    [:christian_catholic,   5,  "Christian - Catholic" ],
    [:christian_orthodox,   6,  "Christian - Orthodox" ],
    [:christian_protestant, 7,  "Christian - Protestant" ],
    [:christian_others,     8,  "Christian - Others" ],
    [:sikh,                 9,  "Sikh" ],
    [:jain_digambar,       10,  "Jain - Digambar" ],
    [:jain_shwetambar,     11,  "Jain - Shwetambar" ],
    [:jain_others,         12,  "Jain - Others" ],
    [:parsi,               13,  "Parsi" ],
    [:buddhist,            14,  "Buddhist" ],
    [:inter_religion,      15,  "Inter-Religion"],
    [:no_religious_belief, 16,  "No Religious Belief" ]
  ])

  BODY_TYPE = ProfileInfoValues.new([
    [:slim,     1, "Slim"],
    [:athletic, 2, "Athletic"],
    [:heavy,    3, "Heavy"]
  ])

  COMPLEXION = ProfileInfoValues.new([
    [:very_fair,      1, "Very Fair"],
    [:fair,           2, "Fair"],
    [:wheatish,       3, "Wheatish"],
    [:wheatish_brown, 4, "Wheatish Brown"],
    [:dark,           5, "Dark"]
  ])

  PHYSICAL_STATUS = ProfileInfoValues.new([
    [:physical_disability, 1, "Physical Disability"],
    [:normal,              2, "Normal"]
  ])

  DOSHAM = ProfileInfoValues.new([
    [:yes,  true, "Yes"],
    [:no,   false, "No"]
  ])

  STAR = ProfileInfoValues.new([
    [:ashwini ,          1,  "Ashwini " ],
    [:bharani,           2,  "Bharani" ],
    [:kritika,           3,  "Kritika"],
    [:rohini,            4,  "Rohini" ],
    [:mrigashirsha,      5,  "Mrigashirsha" ],
    [:arudra,            6,  "Arudra" ],
    [:punarvasu,         7,  "Punarvasu" ],
    [:pushya,            8,  "Pushya" ],
    [:ashlesha,          9,  "Ashlesha" ],
    [:magha,            10,  "Magha" ],
    [:purva,            11,  "Purva or PurvaPhalguni" ],
    [:uttara,           12,  "Uttara or UttaraPhalguni" ],
    [:hasta,            13,  "Hasta" ],
    [:chitra,           14,  "Chitra" ],
    [:swati,            15,  "Swati"],
    [:visakha,          16,  "Visakha" ],
    [:anuradha,         17,  "Anuradha" ], 
    [:jyeshtha,         18,  "Jyeshtha" ],
    [:mula,             19,  "Mula" ],
    [:purvaAshadha,     20,  "PurvaAshadha" ],
    [:uttaraAsadha,     21,  "UttaraAsadha" ],
    [:sravana,          22,  "Sravana" ],
    [:sravistha,        23,  "Sravistha" ],
    [:shatabhisha,      24,  "Shatabhisha" ],
    [:purvaBhadrapada,  25,  "PurvaBhadrapada" ],
    [:uttaraBhadrapada, 26,  "UttaraBhadrapada" ],
    [:revati,           27,  "Revati"]
  ])

  RASHI = ProfileInfoValues.new([
    [:aries,        1,  "Aries" ],
    [:taurus,       2,  "Taurus" ],
    [:gemini,       3,  "Gemini"],
    [:cancer,       4,  "Cancer" ],
    [:leo,          5,  "Leo" ],
    [:virgo,        6,  "Virgo" ],
    [:libra,        7,  "Libra" ],
    [:scorpio,      8,  "Scorpio" ],
    [:sagittarius,  9,  "Sagittarius" ],
    [:capricorn,   10,  "Capricorn" ],
    [:aquarius,    11,  "Aquarius" ],
    [:pisces,      12,  "Pisces" ],
  ])

  FOOD_HABITS = ProfileInfoValues.new([
    [:vegan,          1, "Vegan"],
    [:Vegetarian,     2, "Vegetarian"],
    [:non_vegetarian, 3, "Non Vegetarian"]
  ])

  SMOKING = ProfileInfoValues.new([
    [:yes,          1, "Yes"],
    [:no,           2, "No"],
    [:ocassionally, 3, "Ocassionally"]
  ])

  DRINKING = ProfileInfoValues.new([
    [:yes,          1, "Yes"],
    [:no,           2, "No"],
    [:ocassionally, 3, "Ocassionally"]
  ])

  FAMILY_TYPE = ProfileInfoValues.new([
    [:joint,    1, "Joint"],
    [:nuclear,  2, "Nuclear"]
  ])

  FAMILY_VALUES = ProfileInfoValues.new([
    [:orthodox,    1, "Orthodox"],
    [:traditional, 2, "Traditional"],
    [:moderate,    3, "Moderate"],
    [:liberal,     4, "Liberal"]
  ])

  FAMILY_STATUS = ProfileInfoValues.new([
    [:middle_class,       1, "Middle Class"],
    [:upper_middle_class, 2, "Upper Middle Class"],
    [:rich,               3, "Rich"],
    [:affluent,           4, "Affluent"]
  ])

  included do
    validates :marital_status,  numericality: true, inclusion: MARITAL_STATUS.all_codes,  allow_nil: true
    validates :mother_tongue,   numericality: true, inclusion: MOTHER_TONGUE.all_codes,   allow_nil: true
    validates :religion,        numericality: true, inclusion: RELIGION.all_codes,        allow_nil: true
    validates :height,          numericality: true, allow_nil: true 
    validates :weight,          numericality: true, allow_nil: true 
    validates :body_type,       numericality: true, inclusion: BODY_TYPE.all_codes,       allow_nil: true
    validates :complexion,      numericality: true, inclusion: COMPLEXION.all_codes,      allow_nil: true
    validates :physical_status, numericality: true, inclusion: PHYSICAL_STATUS.all_codes, allow_nil: true
    validates :salary,          numericality: true, allow_nil: true
    validates :star,            numericality: true, inclusion: STAR.all_codes,            allow_nil: true
    validates :rashi,           numericality: true, inclusion: RASHI.all_codes,           allow_nil: true
    validates :food_habits,     numericality: true, inclusion: FOOD_HABITS.all_codes,     allow_nil: true
    validates :smoking,         numericality: true, inclusion: SMOKING.all_codes,         allow_nil: true
    validates :drinking,        numericality: true, inclusion: DRINKING.all_codes,        allow_nil: true
    validates :family_type,     numericality: true, inclusion: FAMILY_TYPE.all_codes,     allow_nil: true
    validates :family_values,   numericality: true, inclusion: FAMILY_VALUES.all_codes,   allow_nil: true
    validates :family_status,   numericality: true, inclusion: FAMILY_STATUS.all_codes,   allow_nil: true
  end

end

