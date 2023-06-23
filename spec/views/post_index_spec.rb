require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Index' do # rubocop:disable Metrics/BlockLength
  let!(:user) do
    new_user = User.new(id: 1, name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!",
                        posts_counter: 0,
                        photo: Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'profile.jpg'),
                                                            'image/jpeg'))
    new_user.save
    new_user
  end

  let!(:post1) do
    user.posts.create(title: 'First post', text: 'This is the first post', comments_counter: 0, likes_counter: 0)
  end

  let!(:post2) do
    user.posts.create(title: 'Second post', text: 'This is the second post', comments_counter: 0, likes_counter: 0)
  end

  before do
    visit '/user/1/post'
  end

  it 'displays the author name' do
    expect(page).to have_content('John Doe')
  end

  it 'display total comments and likes for the post' do
    expect(page).to have_content(post1.comments_counter)
    expect(page).to have_content(post1.likes_counter)
  end

  it 'displays the first comment' do
    expect(page).to have_content(post1.comments.first)
  end

  it 'displays the total number of posts' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'has a link to view each post' do
    visit '/user/1/post'
  end
end
