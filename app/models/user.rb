class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, on: :create, length: { minimum: 6 }
  validates_length_of :password, minimum: 6, on: :update, allow_blank: true

  before_save :generate_slug

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.username.parameterize
  end

  def admin?
    self.role == 'admin'
  end

end
