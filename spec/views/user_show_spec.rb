require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'root page features' do
  include Capybara::DSL
  let(:user) { User.create(name: 'testuser') }

  before(:each) do
    @users = [
      User.create(name: 'Jame', email: 'john.james+2@example.com', bio: "Hello, I'm james!", posts_counter: 3,
                  password: 211_111),
      User.create(name: 'Melissa', email: 'melisa.doe+2@example.com', bio: "Hello, I'm melisa!", posts_counter: 4,
                  password: 121_111),
      User.create(name: 'Nick', bio: 'A software developer', email: 'lilly.doe+2@example.com', posts_counter: 6,
                  password: 111_111)
    ]
    visit '/user'
  end

  it 'displays the user name and profile image' do
    visit '/user'

    expect(page).to have_content(@users.name)
  end

  it 'displays the first 3 posts' do
    visit '/user'

    Post.limit(3).each_with_index do |post, _index|
      expect(page).to have_content(post.text)
    end
  end

  it 'displays the user name and profile image' do
    expect(page).to have_content(@users.name)
    expect(page).to have_content(@users.bio)
    expect(page).to have_content("Number of posts: #{@users.posts_counter}")
  end

  it 'displays a section for pagination' do
    Post.create(author_id: 1, title: 'Post 6', text: 'First Time Home Buyer Tips', comments_counter: 2,
                likes_counter: 3, user:)
    Post.create(author_id: 1, title: 'Post 7', text: 'Job interview tips', comments_counter: 2, likes_counter: 5,
                user:)
    Post.create(author_id: 1, title: 'Post 8', text: 'Nature Photography', comments_counter: 3, likes_counter: 1,
                user:)
    Post.create(author_id: 1, title: 'Post 9', text: 'Preparing for a marathon', comments_counter: 1, likes_counter: 2,
                user:)
    Post.create(author_id: 1, title: 'Post 10', text: 'Favorite cooking recipes', comments_counter: 0,
                likes_counter: 7, user:)
    visit '/user'
  end
end
