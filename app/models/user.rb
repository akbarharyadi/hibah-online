class User < ApplicationRecord
  # include ActiveModel::Validations
  belongs_to :role, optional: true
  belongs_to :dina, optional: true
  has_many :visits, class_name: "Ahoy::Visit"
  mount_uploader :avatar, AvatarUploader

  def active_for_authentication?
    # Uncomment the below debug statement to view the properties of the returned self model values.
    # logger.debug self.to_yaml
      
    super && self.activate == 1
  end

  # Include default devise modules. Others available are:

  # # Basic usage.  Defaults to minimum entropy of 18 and no dictionary checking
  # validates :password, password_strength: true
  # # Minimum entropy can be specified as min_entropy
  # validates :password, password_strength: {min_entropy: 40}
  # # Specifies that we want to use dictionary checking
  # validates :password, password_strength: {use_dictionary: true}
  # # Specifies the minimum size of things that should count as words.  Defaults to 4.
  # validates :password, password_strength: {use_dictionary: true, min_word_length: 6}
  # # Specifies that we want to use dictionary checking and adds 'other', 'common', and 'words' to the dictionary we are checking against.
  # validates :password, password_strength: {extra_dictionary_words: ['other', 'common', 'words'], use_dictionary: true}
  # # You can also specify a method name to pull the extra words from
  # validates :password, password_strength: {extra_dictionary_words: :my_extra_words, use_dictionary: true}
  # # Alternative way to request password strength validation on a field
  # validates_password_strength :password

  validates :nama_ketua, :alamat, :nomor_telp, :nama_organisasi, presence: true, if: "self.role_id == 7 or self.role_id.nil? "
  # Return an array of words to add to the dictionary we check against.
  # def my_extra_words
  #   [self.email, self.nama_ketua]
  # end
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
    self.activate = 0 if self.activate.nil? 
  end
end
