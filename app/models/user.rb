class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable # :confirmable
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments
  validates :name, presence: true

  after_create :update_posts_count

  private

  def update_posts_count
    reload
    update(posts_count: posts.count)
  end

  def recent_posts
    posts.where('created_at >= ?', 1.week.ago).order(created_at: :desc)
  end
end
