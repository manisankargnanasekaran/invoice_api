class WeeklySchedulePdf < Prawn::Document
	byebug
  def initialize(orders)
    super()
     
     @all_orders = orders
    table order_id
  end
def order_id
	byebug
	@all_orders

   [["estimate_id", "customer_company_id", "order_date", "order_number", "remarks", "organization_id" ]]
    @all_orders.map do |user|
      
     [user.estimate_id , user.customer_company_id , user.order_date , user.order_number , user.remarks ,user.organization_id ]
	end
end

end