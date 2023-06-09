class User < ApplicationRecord
  # Define any associations or validations here
  has_many :posts
  validates :name, presence: true
end
