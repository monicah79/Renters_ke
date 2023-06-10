require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'increments comments_counter by 1' do
      user = User.create(name: 'John Doe', email: 'jeopoe@gmail.com', photo: 'photo.jpg', bio: 'Lorem ipsum',
                         posts_counter: 0)
      user.save
      post = user.posts.create(title: 'Hello', text: 'This is my first post', likes_counter: 5, comments_counter: 5)
      post.save
    end
  end
end
