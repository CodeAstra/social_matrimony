# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string
#  remember_created_at :datetime
#  sign_in_count       :integer          default(0), not null
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string
#  last_sign_in_ip     :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  provider            :string
#  uid                 :string
#  name                :string
#  image               :string
#  auth_token          :string
#  auth_expires_at     :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  devise :rememberable, :trackable, 
  :omniauthable, :omniauth_providers => [:facebook]
  
  has_one :candidate, dependent: :destroy
  has_one :user_search_preference, dependent: :destroy

  after_create :populate_candidate, :create_user_search_preference

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.auth_token = auth.credentials.token
      user.auth_expires_at = Time.at(auth.credentials.expires_at)
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def graph
    @graph = Koala::Facebook::API.new(self.auth_token)
  end

  def fb_profile
    graph.get_object("me",fields: "about,address,birthday,education,email,gender,hometown,languages,location,name,religion,work")
  end

private
  def populate_candidate
    self.create_candidate
    self.candidate.populate!
  end
end
