class Question < ApplicationRecord
  validates :title,presence: true,length:{maximum:50}
  validates :content,length:{maximum:1000}
  belongs_to :user
  has_many :answers
end
