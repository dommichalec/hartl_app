class User < ApplicationRecord
  attr_accessor :remember_token
  # needed for bcrypt
  has_secure_password # attr_accessor :password, :password_confirmation
  # callbacks
  before_save { self.email = email.downcase }
  before_save { self.first_name = first_name.downcase.capitalize}
  before_save { self.last_name = last_name.downcase.capitalize}
  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validations
  validates(:first_name, { presence: true, length: { in: 1..50 }})
  validates(:last_name, { presence: true, length: { in: 2..50 }})
  validates(:email, { presence: true , length: { maximum: 50 }, format:
  { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }})
  # allow_nil gives user the ability to leave pw blank upon editing profile
  validates(:password, presence: true, length: { minimum: 6 }, allow_nil: true)

  # combine first_name and last_name attributes into a full name string
  def full_name
    "#{first_name} #{last_name}"
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

 # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
end
