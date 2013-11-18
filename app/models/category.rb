class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :post_categories

  validates :name, presence: true

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = "#{self.id}-#{self.name.parameterize}"
    self
  end

end