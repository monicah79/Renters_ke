require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'root page features' do
  # include Capybara::DSL
  # let!(:user) do
  #   new_user = User.new(
  #     id: 1,
  #     name: 'John Doe',
  #     email: 'john.doe+2@example.com',
  #     bio: "Hello, I'm John!",
  #     posts_counter: 0,
  #     photo: Rack::Test::UploadedFile.new(
  #       Rails.root.join('app', 'assets', 'images', 'profile.jpg'),
  #       'image/jpeg'
  #     )
  #   )
  #   new_user.save
  #   new_user
  # end

  before(:each) do
    @users = [
      User.create(name: 'Fatima', photo: 'https://picsum.photos/300/200', bio: 'CEO Nairobi Hub', posts_counter: 3),
      User.create(name: 'Melissa', photo: 'https://picsum.photos/300/200', bio: 'Teacher from Mexico.',
                  posts_counter: 3),
      User.create(name: 'Nick', photo: 'https://picsum.photos/300/200', bio: 'A software developer', posts_counter: 0)
    ]
    visit '/user'
  end

  it 'displays the user name and profile image' do
    visit '/user'

    expect(page).to have_content(user.name)
  end

  it 'displays the first 3 posts' do
    visit '/user'

    Post.limit(3).each_with_index do |post, _index|
      expect(page).to have_content(post.text)
    end
  end

  it 'displays the user name and profile image' do
    expect(page).to have_content(@users.first.name)
    expect(page).to have_content(@users.first.bio)
    expect(page.has_xpath?("//img[@src='#{@users.first.photo}']")).to be true
    expect(page).to have_content("Number of posts: #{@users.first.posts_counter}")
  end

  it 'displays a section for pagination' do
    Post.create(title: 'Post 6', text: 'First Time Home Buyer Tips', comments_counter: 2, likes_counter: 3)
    Post.create(title: 'Post 7', text: 'Job interview tips', comments_counter: 2, likes_counter: 5)
    Post.create(title: 'Post 8', text: 'Nature Photography', comments_counter: 3, likes_counter: 1)
    Post.create(title: 'Post 9', text: 'Preparing for a marathon', comments_counter: 1, likes_counter: 2)
    Post.create(title: 'Post 10', text: 'Favorite cooking recipes', comments_counter: 0, likes_counter: 7)
    visit '/user'
  end
end
