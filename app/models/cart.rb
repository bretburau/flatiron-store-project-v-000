class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    final_total = 0
    self.line_items.each do |line_item|
      item = Item.find(line_item.id)
      price = item.price * line_item.quantity
      final_total += price
    end
    final_total
  end

  def add_item(new_item_id)
    item_in_cart = self.line_items.find {|i| i.item_id == new_item_id}
    if item_in_cart
      item_in_cart.quantity += 1
      item_in_cart.save
    else
      self.line_items.build(item_id: new_item_id, quantity: 1)
    end
    # item_in_cart.save
  end
end
