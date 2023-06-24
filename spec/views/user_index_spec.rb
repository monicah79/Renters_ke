require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'UsersIndices', type: :feature do
  let(:user) do
    user = User.new(name: 'John Doe', photo: 'https://www.img2link.com/images/2023/04/13/c2bbea766ec481f3d798809dd39eedb6.png',
                    email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0,
                    password: 111_111)
    user.save
    user
  end

  let!(:post) do
    post = Post.create(author_id: 1, title: 'Post 6', text: 'First Time Home Buyer Tips', comments_counter: 2,
                       likes_counter: 3, user:)
    post.save
    post
  end

  describe 'index page' do
    it 'I can see the name of all other users.' do
      visit '/user'
      page.has_content?(user.name)
    end

    it 'can see the number of posts each user has written.' do
      visit '/user'
      page.has_content?(user.posts_counter)
    end

    it "When I click on a user, I am redirected to that user's show page." do
      User.create(name: 'Jame', email: 'john.james+2@example.com', bio: "Hello, I'm james!", posts_counter: 3,
                  password: 211_111)
      visit '/user'
    end
  end
end
