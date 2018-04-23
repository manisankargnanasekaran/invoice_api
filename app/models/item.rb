class Item < ApplicationRecord
  belongs_to :unit
  belongs_to :organization
  has_many :invoice_items
  has_one :order_item, :dependent => :destroy
  has_many :tax_items, :dependent => :destroy
  accepts_nested_attributes_for :tax_items, allow_destroy: true
end
