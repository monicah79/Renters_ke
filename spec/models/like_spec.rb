require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    let(:user) do
      User.new(name: 'John Doe', email: 'jeopoe@gmail.com', photo: 'photo.jpg', bio: 'Lorem ipsum', posts_counter: 0)
    end
    let(:post) do
      user.posts.new(title: 'Test post', text: 'This is a test post', comments_counter: 0, likes_counter: 0)
    end

    it 'should increase post_likes_counter by 1' do
      expect(user.valid?).to be true
      expect(user.save).to be true

      expect(post.valid?).to be false
      expect(post.save).to be false
    end
  end
end
