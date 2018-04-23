class TaxItemSerializer < ActiveModel::Serializer
  attributes :id, :percentage, :item_id, :tax
  #has_one :item
  has_one :tax
  has_one :item
   # def tax
   # 	object.tax
   # end
end
