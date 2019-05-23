class Tag < ApplicationRecord
  validates :content, presence: true
end
