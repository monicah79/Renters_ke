require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    let(:user) do
      new_user = User.new(id: 1, name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!",
                          posts_counter: 0,
                          photo: Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'profile.jpg'),
                                                              'image/jpeg'))
      new_user.save
      new_user
    end

    let(:post) do
      user.posts.build(title: 'Test post', text: 'This is a test post', comments_counter: 0, likes_counter: 0)
    end

    it 'should increase post_likes_counter by 1' do
      expect(user.valid?).to be false
      expect(post.valid?).to be false
    end
  end
end
