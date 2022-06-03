class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  
  validates :body, presence:true

  def liked?(user)
    !!self.likes.find{|like| like.user_id == user.id}
  end

  def like_id(user, post)
    self.likes.find{|like| like.user_id == user.id || like.post_id == post.id }
  end
end
