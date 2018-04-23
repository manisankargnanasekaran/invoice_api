# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180312171915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_categories", force: :cascade do |t|
    t.string "business_category_name"
    t.string "business_category_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "email"
    t.string "mobile"
    t.string "fax"
    t.boolean "is_primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_accounts", force: :cascade do |t|
    t.bigint "customer_company_id"
    t.string "tin"
    t.string "gst_no"
    t.string "tan"
    t.string "pan"
    t.bigint "gst_treatment_id"
    t.float "currency"
    t.string "payment_terms"
    t.boolean "taxable"
    t.string "tax_exempt_reason"
    t.string "place_of_supply"
    t.integer "shipping_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_company_id"], name: "index_customer_accounts_on_customer_company_id"
    t.index ["gst_treatment_id"], name: "index_customer_accounts_on_gst_treatment_id"
  end

  create_table "customer_companies", force: :cascade do |t|
    t.string "company_name"
    t.string "company_code"
    t.bigint "organization_id"
    t.bigint "contact_id"
    t.bigint "address_id"
    t.bigint "social_network_id"
    t.string "location"
    t.string "website"
    t.string "display_name"
    t.string "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customer_companies_on_address_id"
    t.index ["contact_id"], name: "index_customer_companies_on_contact_id"
    t.index ["organization_id"], name: "index_customer_companies_on_organization_id"
    t.index ["social_network_id"], name: "index_customer_companies_on_social_network_id"
  end

  create_table "customer_contact_people", force: :cascade do |t|
    t.string "salutation"
    t.string "first_name"
    t.string "last_name"
    t.string "department"
    t.boolean "is_primary"
    t.bigint "customer_company_id"
    t.bigint "organization_id"
    t.bigint "contact_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_customer_contact_people_on_address_id"
    t.index ["contact_id"], name: "index_customer_contact_people_on_contact_id"
    t.index ["customer_company_id"], name: "index_customer_contact_people_on_customer_company_id"
    t.index ["organization_id"], name: "index_customer_contact_people_on_organization_id"
  end

  create_table "customer_payments", force: :cascade do |t|
    t.string "payment_mode"
    t.datetime "payment_date"
    t.string "reference_number"
    t.string "description"
    t.float "transaction_charges"
    t.boolean "payment_type"
    t.float "amount"
    t.bigint "document_id"
    t.bigint "organization_id"
    t.bigint "customer_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_company_id"], name: "index_customer_payments_on_customer_company_id"
    t.index ["document_id"], name: "index_customer_payments_on_document_id"
    t.index ["organization_id"], name: "index_customer_payments_on_organization_id"
  end

  create_table "documents", force: :cascade do |t|
    t.string "document_name"
    t.string "url"
    t.string "document_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimate_items", force: :cascade do |t|
    t.float "cost_of_item"
    t.integer "quantity"
    t.string "remarks"
    t.bigint "item_id"
    t.bigint "estimate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_estimate_items_on_estimate_id"
    t.index ["item_id"], name: "index_estimate_items_on_item_id"
  end

  create_table "estimates", force: :cascade do |t|
    t.string "estimate_number"
    t.datetime "date_of_estimete"
    t.datetime "expiry_date"
    t.string "name_of_estimate"
    t.string "message"
    t.string "discount_name"
    t.float "discount_percentage"
    t.string "terms_and_condition"
    t.string "remarks"
    t.integer "estimate_status"
    t.bigint "customer_company_id"
    t.bigint "organization_id"
    t.bigint "organization_user_id"
    t.bigint "customer_contact_person_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_company_id"], name: "index_estimates_on_customer_company_id"
    t.index ["customer_contact_person_id"], name: "index_estimates_on_customer_contact_person_id"
    t.index ["document_id"], name: "index_estimates_on_document_id"
    t.index ["organization_id"], name: "index_estimates_on_organization_id"
    t.index ["organization_user_id"], name: "index_estimates_on_organization_user_id"
  end

  create_table "expense_categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_expense_categories_on_organization_id"
  end

  create_table "expense_items", force: :cascade do |t|
    t.boolean "expense_type"
    t.string "expense_code"
    t.string "particular"
    t.string "description"
    t.float "amount"
    t.bigint "tax_id"
    t.bigint "expense_id"
    t.bigint "expense_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_category_id"], name: "index_expense_items_on_expense_category_id"
    t.index ["expense_id"], name: "index_expense_items_on_expense_id"
    t.index ["tax_id"], name: "index_expense_items_on_tax_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.datetime "expenses_date"
    t.boolean "expenses_type"
    t.string "expenses_code"
    t.float "amount"
    t.string "gst_number"
    t.string "vendor_invoice_number"
    t.string "remarks"
    t.string "expenses_number"
    t.bigint "expense_category_id"
    t.bigint "gst_treatment_id"
    t.bigint "place_of_supply_id"
    t.bigint "tax_id"
    t.bigint "customer_company_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "item_wise"
    t.index ["customer_company_id"], name: "index_expenses_on_customer_company_id"
    t.index ["document_id"], name: "index_expenses_on_document_id"
    t.index ["expense_category_id"], name: "index_expenses_on_expense_category_id"
    t.index ["gst_treatment_id"], name: "index_expenses_on_gst_treatment_id"
    t.index ["place_of_supply_id"], name: "index_expenses_on_place_of_supply_id"
    t.index ["tax_id"], name: "index_expenses_on_tax_id"
  end

  create_table "gst_treatments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "gst_required"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoice_items", force: :cascade do |t|
    t.float "tax_cost"
    t.string "description"
    t.integer "number_of_item"
    t.integer "cost_of_item"
    t.float "sub_total"
    t.bigint "organization_id"
    t.bigint "tax_id"
    t.bigint "item_id"
    t.bigint "invoice_id"
    t.float "discount_amount"
    t.float "discount_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["item_id"], name: "index_invoice_items_on_item_id"
    t.index ["organization_id"], name: "index_invoice_items_on_organization_id"
    t.index ["tax_id"], name: "index_invoice_items_on_tax_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "invoice_prefix"
    t.integer "invoice_number"
    t.string "payment_terms"
    t.date "due_date"
    t.date "invoice_date"
    t.bigint "customer_company_id"
    t.bigint "organization_id"
    t.bigint "estimate_id"
    t.bigint "order_id"
    t.bigint "document_id"
    t.integer "payment_status"
    t.float "sub_total"
    t.float "tax_total"
    t.float "shipping_charge"
    t.float "adjustment_charge"
    t.string "adjustment_description"
    t.string "place_of_supply"
    t.string "remarks"
    t.float "discount_total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "grand_total"
    t.float "balance"
    t.index ["customer_company_id"], name: "index_invoices_on_customer_company_id"
    t.index ["document_id"], name: "index_invoices_on_document_id"
    t.index ["estimate_id"], name: "index_invoices_on_estimate_id"
    t.index ["order_id"], name: "index_invoices_on_order_id"
    t.index ["organization_id"], name: "index_invoices_on_organization_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.boolean "product_type"
    t.float "cost_of_item"
    t.string "code"
    t.datetime "deleted_at"
    t.bigint "unit_id"
    t.bigint "organization_id"
    t.bigint "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_items_on_deleted_at"
    t.index ["organization_id"], name: "index_items_on_organization_id"
    t.index ["tax_id"], name: "index_items_on_tax_id"
    t.index ["unit_id"], name: "index_items_on_unit_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "order_id"
    t.integer "cost_of_item"
    t.integer "no_of_items"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "estimate_id"
    t.bigint "customer_company_id"
    t.datetime "order_date"
    t.integer "order_number"
    t.string "remarks"
    t.bigint "organization_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_company_id"], name: "index_orders_on_customer_company_id"
    t.index ["document_id"], name: "index_orders_on_document_id"
    t.index ["estimate_id"], name: "index_orders_on_estimate_id"
    t.index ["organization_id"], name: "index_orders_on_organization_id"
  end

  create_table "organization_accounts", force: :cascade do |t|
    t.string "fiscal_year_start_month"
    t.string "currency_code"
    t.string "currency_symbol"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_accounts_on_organization_id"
  end

  create_table "organization_roles", force: :cascade do |t|
    t.string "role_name"
    t.string "role_code"
    t.string "department"
    t.bigint "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_organization_roles_on_organization_id"
  end

  create_table "organization_users", force: :cascade do |t|
    t.string "salutation"
    t.string "first_name"
    t.string "last_name"
    t.boolean "gender"
    t.string "department"
    t.datetime "deleted_at"
    t.boolean "is_primary"
    t.bigint "address_id"
    t.bigint "organization_role_id"
    t.bigint "organization_id"
    t.bigint "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_organization_users_on_address_id"
    t.index ["contact_id"], name: "index_organization_users_on_contact_id"
    t.index ["deleted_at"], name: "index_organization_users_on_deleted_at"
    t.index ["organization_id"], name: "index_organization_users_on_organization_id"
    t.index ["organization_role_id"], name: "index_organization_users_on_organization_role_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "organization_name"
    t.string "organization_logo"
    t.string "organization_website"
    t.string "business_location"
    t.bigint "contact_id"
    t.bigint "address_id"
    t.bigint "tenant_id"
    t.bigint "business_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_organizations_on_address_id"
    t.index ["business_category_id"], name: "index_organizations_on_business_category_id"
    t.index ["contact_id"], name: "index_organizations_on_contact_id"
    t.index ["tenant_id"], name: "index_organizations_on_tenant_id"
  end

  create_table "payment_invoices", force: :cascade do |t|
    t.bigint "customer_payment_id"
    t.bigint "invoice_id"
    t.float "invoice_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_payment_id"], name: "index_payment_invoices_on_customer_payment_id"
    t.index ["invoice_id"], name: "index_payment_invoices_on_invoice_id"
  end

  create_table "place_of_supplies", force: :cascade do |t|
    t.string "place_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "facebook"
    t.string "google_plus"
    t.string "skype"
    t.string "twitter"
    t.string "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_items", force: :cascade do |t|
    t.bigint "tax_id"
    t.bigint "item_id"
    t.float "percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_tax_items_on_item_id"
    t.index ["tax_id"], name: "index_tax_items_on_tax_id"
  end

  create_table "tax_types", force: :cascade do |t|
    t.string "tax_type"
    t.integer "tax_division"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string "tax_name"
    t.string "description"
    t.float "percentage"
    t.text "child_tax", default: [], array: true
    t.boolean "tax_category"
    t.bigint "organization_id"
    t.bigint "tax_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_taxes_on_organization_id"
    t.index ["tax_type_id"], name: "index_taxes_on_tax_type_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "tenant_name"
    t.string "tenant_location"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_tenants_on_deleted_at"
  end

  create_table "units", force: :cascade do |t|
    t.string "unit_short_code"
    t.string "unit_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_auth_logs", force: :cascade do |t|
    t.string "auth_token"
    t.datetime "deleted_at"
    t.bigint "user_login_detail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_user_auth_logs_on_deleted_at"
    t.index ["user_login_detail_id"], name: "index_user_auth_logs_on_user_login_detail_id"
  end

  create_table "user_login_details", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "deleted_at"
    t.bigint "organization_user_id"
    t.bigint "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_user_login_details_on_deleted_at"
    t.index ["organization_user_id"], name: "index_user_login_details_on_organization_user_id"
    t.index ["tenant_id"], name: "index_user_login_details_on_tenant_id"
  end

  add_foreign_key "customer_accounts", "customer_companies"
  add_foreign_key "customer_accounts", "gst_treatments"
  add_foreign_key "customer_companies", "addresses"
  add_foreign_key "customer_companies", "contacts"
  add_foreign_key "customer_companies", "organizations"
  add_foreign_key "customer_companies", "social_networks"
  add_foreign_key "customer_contact_people", "addresses"
  add_foreign_key "customer_contact_people", "contacts"
  add_foreign_key "customer_contact_people", "customer_companies"
  add_foreign_key "customer_contact_people", "organizations"
  add_foreign_key "customer_payments", "customer_companies"
  add_foreign_key "customer_payments", "documents"
  add_foreign_key "customer_payments", "organizations"
  add_foreign_key "estimate_items", "estimates"
  add_foreign_key "estimate_items", "items"
  add_foreign_key "estimates", "customer_companies"
  add_foreign_key "estimates", "customer_contact_people"
  add_foreign_key "estimates", "documents"
  add_foreign_key "estimates", "organization_users"
  add_foreign_key "estimates", "organizations"
  add_foreign_key "expense_categories", "organizations"
  add_foreign_key "expense_items", "expense_categories"
  add_foreign_key "expense_items", "expenses"
  add_foreign_key "expense_items", "taxes"
  add_foreign_key "expenses", "customer_companies"
  add_foreign_key "expenses", "documents"
  add_foreign_key "expenses", "expense_categories"
  add_foreign_key "expenses", "gst_treatments"
  add_foreign_key "expenses", "place_of_supplies"
  add_foreign_key "expenses", "taxes"
  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "items"
  add_foreign_key "invoice_items", "organizations"
  add_foreign_key "invoice_items", "taxes"
  add_foreign_key "invoices", "customer_companies"
  add_foreign_key "invoices", "documents"
  add_foreign_key "invoices", "estimates"
  add_foreign_key "invoices", "orders"
  add_foreign_key "invoices", "organizations"
  add_foreign_key "items", "organizations"
  add_foreign_key "items", "taxes"
  add_foreign_key "items", "units"
  add_foreign_key "order_items", "items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "customer_companies"
  add_foreign_key "orders", "documents"
  add_foreign_key "orders", "estimates"
  add_foreign_key "orders", "organizations"
  add_foreign_key "organization_accounts", "organizations"
  add_foreign_key "organization_roles", "organizations"
  add_foreign_key "organization_users", "addresses"
  add_foreign_key "organization_users", "contacts"
  add_foreign_key "organization_users", "organization_roles"
  add_foreign_key "organization_users", "organizations"
  add_foreign_key "organizations", "addresses"
  add_foreign_key "organizations", "business_categories"
  add_foreign_key "organizations", "contacts"
  add_foreign_key "organizations", "tenants"
  add_foreign_key "payment_invoices", "customer_payments"
  add_foreign_key "payment_invoices", "invoices"
  add_foreign_key "tax_items", "items"
  add_foreign_key "tax_items", "taxes"
  add_foreign_key "taxes", "organizations"
  add_foreign_key "taxes", "tax_types"
  add_foreign_key "user_auth_logs", "user_login_details"
  add_foreign_key "user_login_details", "organization_users"
  add_foreign_key "user_login_details", "tenants"
end
