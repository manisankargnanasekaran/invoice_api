class TaxItem < ApplicationRecord
  belongs_to :tax
  belongs_to :item
end
