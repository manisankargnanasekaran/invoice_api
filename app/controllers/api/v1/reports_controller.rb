module Api
  module V1
    class ReportsController < ApplicationController
       respond_to :docx


    	def customer_sales
        startDate = params[:from_date] if params[:from_date].present?
        endDate =  params[:to_date] if params[:to_date].present?
        @invoice_ids = InvoiceItem.where(item_id: params[:item_id]).pluck(:invoice_id).uniq if params[:item_id].present?
        @invoice = Invoice.where(nil)
        @invoice = @invoice.where(id: @invoice_ids) if params[:item_id].present?
        #item_id = params[:item_id] if params[:item_id].present?
        #byebug
        params['invoice_date'] = [startDate..endDate] if params[:from_date].present?
        customer_company_id = params[:customer_company_id] if params[:customer_company_id].present?
        filtering_params(params).each do |key, value|

         @invoice = @invoice.where(key.to_sym => value) if value.present?
    
       #, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]
      end
      render json: @invoice
    	  #@invoices = Invoice.where(organization_id: current_user.organization_user.organization_id)
        #render json: @invoices, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]
    	end

      def payment_received
         startDate = params[:from_date] if params[:from_date].present?
         endDate =  params[:to_date] if params[:to_date].present?
         customer_company_id = params[:customer_company_id] if params[:customer_company_id].present?
         params['payment_date'] = [startDate.to_date..endDate.to_date] if params[:from_date].present?
         @payment = CustomerPayment.where(nil)
         filtering_customer_payment_params(params).each do |key, value|
           @payment = @payment.where(key.to_sym => value) if value.present?
         end
        render json: @payment
      end

#@data = Expense.group(:customer_company_id).sum(:amount).sort_by(&:last).reverse.to_h
  #CustomerPayment.group(:customer_company_id).sum(:amount).sort_by(&:last).reverse.to_h
    	def item_wise_sales
    		#byebug
    		#@invoices = Invoice.where(organization_id: current_user.organization_user.organization_id)
    		@invoices = InvoiceItem.where(item_id: params[:id], organization_id: current_user.organization_user.organization_id).map{|i| i.invoice}
        render json: @invoices, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]

    	end



    def invoice_vs_payment   
     
         startDate = params[:from_date] if params[:from_date].present?
         endDate =  params[:to_date] if params[:to_date].present?
         @customer_company_id = params[:customer_company_id] if params[:customer_company_id].present?
         params['payment_date'] = [DateTime.parse(startDate)..DateTime.parse(endDate)] if params[:from_date].present?
         @cus_payment_id = CustomerPayment.where(payment_date: params['payment_date'], customer_company_id: @customer_company_id).pluck(:id).uniq
         @payment_invoice = PaymentInvoice.where(customer_payment_id: @cus_payment_id)
      render json: @payment_invoice

    end



    	def customer_balance
    		@invoices = Invoice.where(organization_id: current_user.organization_user.organization_id).where(payment_status: "UnPaid")
        render json: @invoices, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]
    		
    	end

    	def customer_wise_invoice_payment
      
        startDate = params[:from_date] if params[:from_date].present?
        endDate =  params[:to_date] if params[:to_date].present?
        customer_company_id = params[:customer_company_id] if params[:customer_company_id].present?
        
        params['invoice_date'] = [startDate..endDate] if params[:from_date].present?


        if params[:payment_status] == "Paid"
        @invoice = Invoice.where(payment_status: 2)
        end

        if params[:payment_status] == "UnPaid"
        @invoice = Invoice.where(payment_status: [1,3])
        end
     
         filtering_payment_params(params).each do |key, value|
           @invoice = @invoice.where(key.to_sym => value) if value.present?

         end
    		#@invoices = Invoice.where(organization_id: current_user.organization_user.organization_id).where(payment_status: "UnPaid")
        render json: @invoice, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]
    		
    	end

    	def sales_invoice_date_range
    		@invoices = Invoice.where(organization_id: current_user.organization_user.organization_id, invoice_date: params[:from_date]..params[:to_date])
    		render json: @invoices, include: ["customer_company","invoice_items.tax", "invoice_items.item"  ]
    	end

      def expense_report
        startDate = params[:from_date] if params[:from_date].present?
        endDate =  params[:to_date] if params[:to_date].present?
        customer_company_id = params[:customer_company_id] if params[:customer_company_id].present?
        params['expenses_date'] = [startDate.to_date..endDate.to_date] if params[:from_date].present?
        @expenses = Expense.where(nil)
        filtering_expense_params(params).each do |key, value|
          @expenses = @expenses.where(key.to_sym => value) if value.present?
        end
        render json: @expenses


      end

      def sales_age_wise_report
        start_period = params[:period].split("-")[0].to_i if params[:period].present?
        end_period = params[:period].split("-")[1].to_i if params[:period].present?
        @customer_company_id = params[:customer_company_id] if params[:customer_company_id].present?
    
        params[:created_at] = [end_period.day.ago.beginning_of_day..start_period.day.ago.beginning_of_day] if params[:period].present?
        @invoices = Invoice.where(customer_company: @customer_company_id, created_at: params[:created_at])
      
        render json: @invoices
      end

      def day_wise_payment
        start_period1 = params[:period1].split("-")[0].to_i if params[:period1].present?
        end_period1 = params[:period1].split("-")[1].to_i if params[:period1].present?
        params[:payment_date] = [end_period1.day.ago.beginning_of_day..start_period1.day.ago.beginning_of_day]
        @period1 = CustomerPayment.where(payment_date: params[:payment_date]).pluck(:amount).compact.sum


        start_period2 = params[:period2].split("-")[0].to_i if params[:period2].present?
        end_period2 = params[:period2].split("-")[1].to_i if params[:period2].present?
        params[:payment_date] = [end_period2.day.ago.beginning_of_day..start_period2.day.ago.beginning_of_day]
        @period2 = CustomerPayment.where(payment_date: params[:payment_date]).pluck(:amount).compact.sum


        start_period3 = params[:period3].split("-")[0].to_i if params[:period3].present?
        end_period3 = params[:period3].split("-")[1].to_i if params[:period3].present?
        params[:payment_date] = [end_period3.day.ago.beginning_of_day..start_period3.day.ago.beginning_of_day]
        @period3 = CustomerPayment.where(payment_date: params[:payment_date]).pluck(:amount).compact.sum

        start_period4 = params[:period4].split("-")[0].to_i if params[:period4].present?
        end_period4 = params[:period4].split("-")[1].to_i if params[:period4].present?
        params[:payment_date] = [end_period4.day.ago.beginning_of_day..start_period4.day.ago.beginning_of_day]
        @period4 = CustomerPayment.where(payment_date: params[:payment_date]).pluck(:amount).compact.sum
        
        final_data = [ {:period => params[:period1], :value => @period1},{:period => params[:period2], :value => @period2}, {:period => params[:period3], :value => @period3}, {:period => params[:period4], :value => @period4}].to_json
         render :json => final_data
        #render json: @period1#, @period2, @period3, @period4
      end

      def invoice_total
        @invoice_total = Invoice.all.pluck(:grand_total).compact.sum
        @cus_payment_total = CustomerPayment.all.pluck(:amount).compact.sum
        @expenses = Expense.all.pluck(:amount).compact.sum
        @exp_item_amount = ExpenseItem.all.pluck(:amount).compact.sum
        @expenses_total = @expenses + @exp_item_amount
        render :json => {:invoice_total => @invoice_total, :customer_payment_total => @cus_payment_total, :expenses => @expenses_total}  
      end

      def month_wise_total
         
     # see later -->

        @last_12_months = (Date.today - 12.month..Date.today).map{|ii| ii.strftime("%b-%Y")}.uniq
        @invoice_last_12_months_data = @last_12_months.map{|mon| Invoice.where(invoice_date: mon.to_date.beginning_of_day..mon.to_date.end_of_month.end_of_day).pluck(:grand_total).compact.sum}
        @cus_pay_last_12_months_data = @last_12_months.map{|mon| CustomerPayment.where(payment_date: mon.to_date.beginning_of_day..mon.to_date.end_of_month.end_of_day).pluck(:amount).compact.sum}
        @expense_last_12_months_data = @last_12_months.map{|mon| Expense.where(expenses_date: mon.to_date.beginning_of_day..mon.to_date.end_of_month.end_of_day).pluck(:amount).compact.sum}
        @exp_item_last_12_months_data = @last_12_months.map{|mon| ExpenseItem.where(created_at: mon.to_date.beginning_of_day..mon.to_date.end_of_month.end_of_day).pluck(:amount).compact.sum}
         @final_data =[]
        temp = 0
        @last_12_months.map do |m|
       
          @final_data << { month: m, invoice_amount:@invoice_last_12_months_data[temp], customer_payment: @cus_pay_last_12_months_data[temp], expense_amount: @expense_last_12_months_data[temp]}
          temp = temp + 1
          end
        render :json => @final_data 
      end


      def top_expenses
         a = Expense.all.group_by(&:customer_company_id)
         result = a.map{|k,v| [CustomerCompany.find(k).company_name, v.map{|i| i.expense_items.pluck(:amount).sum}.sum + v.pluck(:amount).sum]}.sort_by(&:last).reverse.first(3)
         @data = [{:name => result.first[0], :amount => result.first[1]}, {:name => result.second[0], :amount => result.second[1]}, {:name => result.third[0], :amount => result.third[1]}]
         render :json => @data #a.map{|k,v| [CustomerCompany.find(k).company_name, v.pluck(:amount).sum] }
      end

      def top_customer_payments
        a = CustomerPayment.all.group_by(&:customer_company_id)
        result = a.map{|k,v| [CustomerCompany.find(k).company_name, v.pluck(:amount).sum]}.sort_by(&:last).reverse.first(3)
        @data = [{:name => result.first[0], :amount => result.first[1]}, {:name => result.second[0], :amount => result.second[1]}, {:name => result.third[0], :amount => result.third[1]}]

        render :json => @data
      end



      def generate_mail

        @invoice = Invoice.first
        respond_to do |format|
          format.html
          format.pdf do
            pdf = InvoicePdf.new(@invoice)
           
            send_data pdf.render, filename: 'generate_mail.pdf', type: 'application/pdf', disposition: "inline"
          end
        end
         @generated_pdf_name = "#{@student_fee_pay.student_detail.student.student_name}(#{@student_fee_pay.dated.to_date.strftime("%d-%m-%Y") }).pdf"
    StudentFeeReceiptMailer.send_studentfee_receipt(@student_detail, @student_fee_pay.id, @generated_pdf_name).deliver_now!
      end


  def fees_receipt
    @student_fee_pay = StudentFeePay.find(params[:id])
    @student_detail = @student_fee_pay.student_detail_id
      respond_to do |format|
        format.html
        format.pdf do
        render :pdf => "FeesReceipt", disposition: "attachment", :template => 'student_fee_pays/_fees_receipt.html.erb', :save_to_file => Rails.root.join('public/pdfs', "#{@student_fee_pay.student_detail.student.student_name}(#{@student_fee_pay.dated.to_date.strftime("%d-%m-%Y") }).pdf")
      end
    end
    @generated_pdf_name = "#{@student_fee_pay.student_detail.student.student_name}(#{@student_fee_pay.dated.to_date.strftime("%d-%m-%Y") }).pdf"
    StudentFeeReceiptMailer.send_studentfee_receipt(@student_detail, @student_fee_pay.id, @generated_pdf_name).deliver_now!
  end







    	private
        def filtering_params(params)
            params.slice(:customer_company_id, :invoice_date)
        end
       
        def filtering_payment_params(params)
            params.slice(:customer_company_id, :invoice_date)
        end

        def filtering_customer_payment_params(params)
            params.slice(:customer_company_id, :payment_date)
        end

        def filtering_expense_params(params)
            params.slice(:customer_company_id, :expenses_date)
        end
    end
  end
end






