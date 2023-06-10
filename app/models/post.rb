class Post < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', counter_cache: true
  validates :author, presence: true
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id

  def initialize(attributes = nil)
    super
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end

  private

  def update_author_posts_counter
    author.update(posts_count: author.posts.count)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
