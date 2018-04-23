require "byebug"
class CustomerContactPerson < ApplicationRecord
  belongs_to :customer_company
  belongs_to :organization
  belongs_to :contact
  belongs_to :address, optional: true
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :contact, allow_destroy: true
#   attr_accessor :current_user  

 #   before_create :organization_insert  
 #     def organization_insert
 #  	byebug
 #    self.organization_id = current_user.organization_user.organization_id
 # end

# byebug
# private

end
