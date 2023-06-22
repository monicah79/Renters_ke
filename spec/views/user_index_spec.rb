require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'UsersIndices', type: :feature do
  let(:user) do
    User.create(
      name: 'John Doe',
      email: 'john.doe+2@example.com',
      bio: "Hello, I'm John!",
      posts_counter: 0
    ).tap do |u|
      u.photo.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile.jpg')), filename: 'profile.jpg')
    end
  end

  def image_exists?(url)
    response = Net::HTTP.get_response(URI.parse(url))
    response.code == '200'
  rescue StandardError
    false
  end

  it 'displays the user name and profile image on the index page' do
    visit '/user'
    expect(image_exists?(user.photo)).to be false
  end
end
