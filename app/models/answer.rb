class Answer < ApplicationRecord
  validates :content,presence: true,length:{maximum:1000}
  belongs_to :user
end