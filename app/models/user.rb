class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  validates :name, presence: true
  validates :photo, presence: true
  validates :bio, presence: true
  validates :posts_counter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :email, presence: true, uniqueness: true

  after_create :update_posts_count

  private

  def update_posts_count
    reload
    update(posts_count: posts.count)
  end
end
