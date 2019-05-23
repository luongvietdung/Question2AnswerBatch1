class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :users
  validates :content, presence: true, length: { maximum: 300 }
end
