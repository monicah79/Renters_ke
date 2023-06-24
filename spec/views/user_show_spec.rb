require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'root page features' do
  include Capybara::DSL
  let!(:user) do
    user = User.new(name: 'John Doe', email: 'john.doe+2@example.com', bio: "Hello, I'm John!", posts_counter: 0,
                    password: 111_111)
    user.save
    user
  end

  before(:each) do
    visit '/user'
  end

  it 'displays the first 3 posts' do
    visit '/user'

    Post.limit(3).each_with_index do |post, _index|
      expect(page).to have_content(post.text)
    end
  end

  it 'I can see the number of posts the user has written.' do
    visit '/user'
    page.has_content?(user.posts_counter)
  end

  it "I can see the user's bio." do
    visit '/user'
    page.has_content?(user.bio)
  end

  before(:each) do
    visit '/user'
  end

  it "I can see a button that lets me view all of a user's posts." do
    visit 'user'
    page.has_button?('See all posts')
  end

  it "When you go see all posts, it redirects me to the user's post's index page." do
    visit 'user'
    visit 'user/1post'
    page.has_content?(user.name)
  end
end
