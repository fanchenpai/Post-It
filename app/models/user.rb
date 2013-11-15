class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create, length: { minimum: 6 }
  validates :password, on: :update,length: { minimum: 6 }
end
