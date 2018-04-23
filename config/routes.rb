Rails.application.routes.draw do


 
  #resources :expense_items
  #resources :expenses
  #resources :expense_categories
  # resources :customer_accounts
  # resources :estimate_items
  # resources :estimates
  # resources :gst_treatments
  # resources :customer_contact_people
  # resources :customer_companies
  # resources :social_networks
  # resources :items
  # resources :units
  # resources :taxes
  # resources :user_login_details
  # resources :organization_users
  # resources :organization_accounts
  # resources :organization_roles
  # resources :organizations
  # resources :business_categories
  # resources :contacts
  # resources :addresses
  # resources :tenants
   namespace :api, defaults: {format: 'json'} do
    namespace :v1 do

      post 'auth/login' => 'sessions#login'
      get 'auth/logout' => 'sessions#logout'
      get 'payment_invoices' => 'customer_payments#payment_invoice'
      post 'payment_invoice_create' => 'customer_payments#payment_invoice_create'
      get 'get_customer_companies' => 'customer_companies#get_customer_company'
      get "place_of_supplies" => "invoices#place_of_supply"
      get "tax" => "taxes#tax" #tax_category:false only display
      get "tax_type_intra" => "taxes#tax_type_intra"
      get "tax_type_inter" => "taxes#tax_type_inter"
      
      get "invioce_item" => "items#invioce_item"
      get "top_customer_payments" => "reports#top_customer_payments"
      get "top_expenses" => "reports#top_expenses"
      get "month_wise_total" => "reports#month_wise_total"
      get "invoice_total" => "reports#invoice_total"
      get "day_wise_payment" => "reports#day_wise_payment"
      get "expense_report" => "reports#expense_report"
      get "sales_age_wise_report" => "reports#sales_age_wise_report"
      get "invoice_vs_payment" => "reports#invoice_vs_payment"
      get "payment_received" => "reports#payment_received"
      get "customer_sales" => "reports#customer_sales"
      get "item_wise_sales" => "reports#item_wise_sales"
      get "customer_balance" => "reports#customer_balance"
      get "invoice_payment" => "reports#customer_wise_invoice_payment"
      get "invoice_date_range"=> "reports#sales_invoice_date_range"
      #get 'get_customer_companies' => 'customer_companies#get_customer_company'
      patch 'update_billing_address' => 'customer_companies#update_billing_address'
      patch 'update_shipping_address' => 'customer_companies#update_shipping_address'
      post 'child_tax' => 'taxes#tax_detail'
      get 'generate_mail' => 'reports#generate_mail'
      
      resources :expense_items
      resources :expenses
      resources :expense_categories
      resources :tax_types
      resources :customer_payments
      resources :invoices
      resources :orders
      resources :customer_accounts
      resources :estimate_items
      resources :estimates
      resources :gst_treatments
      resources :customer_contact_people
      resources :customer_companies
      resources :social_networks
      resources :tax_items
      resources :items
      resources :taxes
      resources :user_login_details
      resources :organization_users
      resources :organization_accounts
      resources :organization_roles
      resources :organizations
      resources :business_categories
      resources :contacts
      resources :addresses
      resources :tenants
      resources :units  
      end
    end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
