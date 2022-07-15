class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable, dependent: :destroy

  validates_presence_of :content

  def liked_by?(user)
    likes.where(user: user).exists?
  end
end
