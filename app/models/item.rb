class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  belongs_to :cart
end
