class Estimate < ApplicationRecord
  belongs_to :customer_company
  belongs_to :organization
  belongs_to :organization_user
  belongs_to :customer_contact_person
end
