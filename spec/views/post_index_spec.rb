require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Index' do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    user = User.new(name: 'John Doe', photo: 'https://www.img2link.com/images/2023/04/13/c2bbea766ec481f3d798809dd39eedb6.png',
                    email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0,
                    password: 111_111)
    user.save
    user
  end

  let!(:post) do
    post = Post.create(author_id: 1, title: 'Post 6', text: 'First Time Home Buyer Tips', comments_counter: 0,
                       likes_counter: 0, user:)
    post.save
    post
  end

  let!(:post2) do
    user.posts.create(title: 'Second post', text: 'This is the second post', comments_counter: 0, likes_counter: 0)
  end

  let!(:comment1) do
    Comment.create(author: user, post:, text: 'Good post', user:)
  end

  def image_exists?(url)
    response = Net::HTTP.get_response(URI.parse(url))
    response.code == '200'
  rescue StandardError
    false
  end

  before do
    visit '/user/1/post'
  end

  it 'I can see the users profile picture' do
    visit '/user'

    expect(image_exists?(user.photo)).to be true
  end

  it 'displays the first comment' do
    expect(page).to have_content(post.comments.first)
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
    page.has_content?(post.text)
  end
end
