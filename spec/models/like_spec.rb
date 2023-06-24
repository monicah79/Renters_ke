require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_counter' do
    let(:user) do
      new_user = User.new(name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0, password: 111111)
      new_user.save
      new_user
    end

    let(:post) do
      Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: 0,
     likes_counter: 0 )
    end
  end
end
