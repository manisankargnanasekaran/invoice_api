class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id,  :description, :cost_of_item, :number_of_item, :tax_cost, :sub_total, :discount_amount, :discount_percentage, :item, :tax
   has_many :items
#def item
#	object.item
#end

#def item
#	object.tax
#end
end
