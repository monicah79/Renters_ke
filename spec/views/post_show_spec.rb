require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Show' do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    new_user = User.new(
      id: 1,
      name: 'John Doe',
      email: 'john.doe+2@example.com',
      bio: "Hello, I'm John!",
      posts_counter: 0,
      photo: Rack::Test::UploadedFile.new(
        Rails.root.join('app', 'assets', 'images', 'profile.jpg'),
        'image/jpeg'
      )
    )
    new_user.save
    new_user
  end

  let!(:post) do
    user.posts.create(
      title: 'First post',
      text: 'This is the first post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  let!(:comment1) do
    comment0 = Comment.create(
      author: user,
      text: 'First comment'
    )
    comment0.save
    comment0
  end

  let!(:comment2) do
    comment3 = Comment.new(
      author: user,
      text: 'Very interesting'
    )
    comment3.save
    comment3
  end

  before do
    visit "/user/#{user.id}/post/#{post.id}"
  end

  it 'displays post author name' do
    expect(page).to have_content(user.name)
  end

  it 'counts total number of comments' do
    expect(post.comments_counter).to eq(0)
  end

  it 'displays comment text' do
    expect(page).to have_content(post.comments.first)
  end
end