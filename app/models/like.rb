class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_count: post.likes.count)
  end

  after_commit :update_likes_counter

  def create_post
    post = user.posts.create(title: 'Test post', text: 'This is a test post', comments_counter: 0, likes_counter: 0)
    self.post = post
    save
  end
end
