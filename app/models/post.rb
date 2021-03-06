class Post < ActiveRecord::Base
  include Voteable
  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :url, presence: true, uniqueness: { case_sensitive: false }

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = "#{self.id}-#{self.title.parameterize}"
    self
  end

end