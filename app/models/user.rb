class User < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password,length: { minimum: 6 }
  has_many :questions
  has_many :answers
  has_secure_password
end
