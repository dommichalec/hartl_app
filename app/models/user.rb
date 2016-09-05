class User < ApplicationRecord
  # validations
  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
end
