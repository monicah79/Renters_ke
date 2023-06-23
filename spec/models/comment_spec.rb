require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'increments comments_counter by 1' do
      new_user = User.create(name: 'Melissa', photo: 'https://picsum.photos/300/200', bio: 'Teacher from Mexico.',
      posts_counter: 3),

      new_user.save
      post = new_user.posts.build(title: 'Test post', text: 'This is a test post', comments_counter: 0,
                                  likes_counter: 0)
      post.save
    end
  end
end
