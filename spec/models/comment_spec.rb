require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'increments comments_counter by 1' do
     new_user = User.create(id: 1, name: "John Doe", email: "john.doe+2@example.com", bio: "Hello, I'm John!", posts_counter: 0)
     new_user.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.jpg')), filename: 'profile.jpg')

      new_user.save
      post = new_user.posts.build(title: 'Test post', text: 'This is a test post', comments_counter: 0, likes_counter: 0)
      post.save
    end
  end
end
