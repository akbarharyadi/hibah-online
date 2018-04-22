class User < ApplicationRecord
  belongs_to :role, optional: true
  belongs_to :dina, optional: true
  has_many :visits, class_name: "Ahoy::Visit"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable #, :omniauthable, omniauth_providers: [:google_oauth2]
  # def self.from_omniauth(access_token)
  #     data = access_token.info
  #     user = User.where(email: data['email']).first

  #     # Uncomment the section below if you want users to be created if they don't exist
  #     unless user
  #         user = User.create(name: data['name'],
  #            email: data['email'],
  #            password: Devise.friendly_token[0,20]
  #         )
  #     end
  #     user
  # end
  before_save :default_values
  def password_required?
    if respond_to?(:reset_password_token)
      return true if reset_password_token.present?
    end
    return true if new_record?
    password.present? || password_confirmation.present?
  end
  def default_values
    self.role_id = 7 if self.role_id.nil? # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end
