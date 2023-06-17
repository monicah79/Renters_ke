class Post < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', counter_cache: true, foreign_key: 'author_id'
  validates :author, presence: true
  has_many :likes, foreign_key: :post_id
  has_many :comments, foreign_key: :post_id
  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :recent, -> { where('created_at >= ?', 1.week.ago).order(created_at: :desc) }

  after_create :increment_user_posts_counter
  after_destroy :decrement_user_posts_counter

  private

  def increment_user_posts_counter
    user.increment!(:posts_counter)
  end

  def decrement_user_posts_counter
    user.decrement!(:posts_counter)
  end

  def initialize(attributes = nil)
    super
    self.likes_counter ||= 0
    self.comments_counter ||= 0
  end

  def update_author_posts_counter
    author.update(posts_count: author.posts.count)
  end

  def recent_comments(post_id)
    Post.find(post_id).comments.order(created_at: :desc).limit(5)
  end
end
