require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'increments comments_counter by 1' do
      new_user = User.new(name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0,
                          password: 111_111)

      new_post = Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: 0,
                          likes_counter: 0, user: new_user, author: new_user)
      new_post.save
    end
  end
end
