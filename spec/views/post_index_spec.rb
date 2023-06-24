require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Index' do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    user = User.new(name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0,
                    password: 111_111)
    user.save
    user
  end

  let!(:post1) do
    post = Post.create(author_id: 1, title: 'Post 6', text: 'First Time Home Buyer Tips', comments_counter: 2,
                       likes_counter: 3, user:)
    post.save
    post
  end

  let!(:post2) do
    user.posts.create(title: 'Second post', text: 'This is the second post', comments_counter: 0, likes_counter: 0)
  end

  before do
    visit '/user/1/post'
  end

  it "I can see the user's name." do
    visit '/user/1/post'
    page.has_content?(user.name)
  end

  it 'I can see the number of posts the user has written.' do
    visit '/user/1/post'
    page.has_content?(user.posts_counter)
  end

  it "I can see a post's title." do
    visit '/user/1/post'
    page.has_content?(post.title)
  end

  it 'has a link to view each post' do
    visit '/user/1/post'
  end
end
