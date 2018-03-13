class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  belongs_to :cart

  def self.available_items
    Item.all.find_all {|i| i.inventory > 0 }
  end
end
