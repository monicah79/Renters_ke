require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    let(:user) { User.create(name: 'testuser') }
    let(:author) { Author.create(name: 'testauthor') }
    let(:post) do
      Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: 0,
               likes_counter: 'abc')
    end

    it 'validates presence of title' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'is not valid without a title' do
      expect(subject).to_not be_valid
    end

    it 'is not valid without an author_id' do
      post = Post.new(author_id: nil, title: 'Test post', text: 'This is a test post', comments_counter: 0,
                      likes_counter: 0)
      expect(post).to_not be_valid
    end

    it 'is not valid without text' do
      post = Post.new(author_id: 1, title: 'Test post', text: nil, comments_counter: 0, likes_counter: 0)
      expect(post).to_not be_valid
    end

    it 'is not valid without a comments_counter' do
      post = Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: nil,
                      likes_counter: 0)
      expect(post).to_not be_valid
    end

    it 'is not valid without a likes_counter' do
      post = Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: 0,
                      likes_counter: nil)
      expect(post).to_not be_valid
    end

    it 'is not valid with a non-numeric comments_counter' do
      post = Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: 'abc',
                      likes_counter: 0)
      expect(post).to_not be_valid
    end

    it 'is not valid with a non-numeric likes_counter' do
      post = Post.new(author_id: 1, title: 'Test post', text: 'This is a test post', comments_counter: 0,
                      likes_counter: 'abc')
      expect(post).to_not be_valid
    end

    it 'is not valid with a long title' do
      subject.title = 'a' * 251
      subject.text = 'This is my first post.'
      subject.comments_counter = 0
      subject.likes_counter = 0
      expect(subject).to_not be_valid
    end

    it 'validates maximum length of title' do
      post.title = 'a' * 251
      expect(post).not_to be_valid
    end

    it 'is not valid with a negative comments counter' do
      subject.title = 'Hello, World!'
      subject.text = 'This is my first post.'
      subject.comments_counter = -1
      subject.likes_counter = 0
      expect(subject).to_not be_valid
    end

    it 'is not valid with a negative likes counter' do
      subject.title = 'Hello, World!'
      subject.text = 'This is my first post.'
      subject.comments_counter = 0
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be greater than or equal to zero' do
      likes_counter = post.likes.count

      expect(likes_counter).to be >= 0
    end

    it 'comments_counter should be greater than or equal to zero' do
      comments_counter = post.comments.count
      expect(comments_counter).to be >= 0
    end
  end
end
