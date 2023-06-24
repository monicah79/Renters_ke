require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Show' do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    user = User.new(name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0,
                    password: 111_111)
    user.save
    user
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

  it "I can see the user's name." do
    visit '/user/1/post'
    page.has_content?(user.name)
  end

  it 'counts total number of comments' do
    expect(post.comments_counter).to eq(0)
  end

  it 'displays comment text' do
    expect(page).to have_content(post.comments.first)
  end
end
