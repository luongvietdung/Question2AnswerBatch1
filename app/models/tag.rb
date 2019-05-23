class Tag < ApplicationRecord
  validates :content, presence: true
  has_and_belongs_to_many :questions
end
