class Item < ApplicationRecord
  belongs_to :category
  has_many :line_items
  has_many :uploads

  def self.available_items
    where("inventory > 0")
  end

  def category_name=(name)
    self.category = Category.find_or_create_by(name: name)
  end

  def category_name
    self.category.name if self.category
  end

  def self.with_category(category_id)
    where(category: category_id)
  end

end
