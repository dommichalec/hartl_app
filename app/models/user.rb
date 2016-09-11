class User < ApplicationRecord
  # needed for bcrypt
  has_secure_password # attr_accessor :password, :password_confirmation
  # callbacks
  before_save { self.email = email.downcase }
  before_save { self.first_name = first_name.capitalize}
  before_save { self.last_name = last_name.capitalize}
  # constants
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  # validations
  validates(:first_name, :last_name, { presence: true, length: { in: 2..50 }})
  validates(:email, { presence: true , length: { maximum: 50 }, format:
  { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }})
  validates(:password, presence: true, length: { minimum: 6 })

  # combine first_name and last_name attributes into a full name string
  def full_name
    "#{first_name} #{last_name}"
  end
end
