class Cart < ApplicationRecord

  belongs_to :user
  has_one :order
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def item_count
    self.line_items.count
  end

  def add_item(item_id)
    @item = Item.find(item_id)
    if items.include?(@item)
      line_item = line_items.find_by(item_id: item_id)
      line_item.quantity += 1
    else
      line_item = line_items.build(item: @item, quantity: 1)
    end
    line_item
  end

end
