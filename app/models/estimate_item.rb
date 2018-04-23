class EstimateItem < ApplicationRecord
  belongs_to :item
  belongs_to :estimate
  belongs_to :document, optional: true

end
