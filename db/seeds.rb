PlaceOfSupply.create!([
  {place_name: "Jammu and Kashmir"},
  {place_name: "Jharkhand"},
  {place_name: "Karnataka"},
  {place_name: "Kerala"},
  {place_name: "Madhya Pradesh"},
  {place_name: "Maharashtra"},
  {place_name: "Manipur"},
  {place_name: "Meghalaya"},
  {place_name: "Mizoram"},
  {place_name: "Nagaland"},
  {place_name: "Odisha"},
  {place_name: "Punjab"},
  {place_name: "Rajasthan"},
  {place_name: "Sikkim"},
  {place_name: "Tamil Nadu"},
  {place_name: "Telangana"},
  {place_name: "Tripura"},
  {place_name: "Uttar Pradesh"},
  {place_name: "Uttarakhand"},
  {place_name: "West Bengal"},
  {place_name: "Andaman and Nicobar Islands"},
  {place_name: "Chandigarh"},
  {place_name: "Dadra and Nagar Haveli"},
  {place_name: "Daman and Diu"},
  {place_name: "Delhi"},
  {place_name: "Andhra Pradesh"},
  {place_name: "Arunachal Pradesh"},
  {place_name: "Assam"},
  {place_name: "Bihar"},
  {place_name: "Chhattisgarh"},
  {place_name: "Goa"},
  {place_name: "Gujarat"},
  {place_name: "Haryana"},
  {place_name: "Himachal Pradesh"},
  {place_name: "Lakshadweep"},
  {place_name: "Puducherry"}
])
Address.create!([
  {address_line1: "KPR College", address_line2: "Thennampalayam", city: "Coimbatore", state: "Tamilnadu", country: "India", postal_code: "600274"}
])
BusinessCategory.create!([
  {business_category_name: "Paper manufacturing", business_category_code: "001"}
])
Contact.create!([
  {email: "sriannapoorani.thoughtbees@gmail.com", mobile: nil, fax: nil, is_primary: true}
])
Tenant.create!([
  {tenant_name: "Sri Annapoorani papers and boards", tenant_location: "India", deleted_at: nil}
])
Organization.create!([
  {organization_name: "Sri Annapoorani Paper Manufacturing", organization_logo: nil, organization_website: nil, business_location: "Coimbatore", contact_id: 1, address_id: 1, tenant_id: 1, business_category_id: 1}
])
OrganizationAccount.create!([
  {fiscal_year_start_month: "march", currency_code: "INR", currency_symbol: "₹", organization_id: 1}
])
OrganizationRole.create!([
  {role_name: "admin", role_code: "001", department: "HR", organization_id: 1}
])
OrganizationUser.create!([
  {salutation: "Mr", first_name: "ram", last_name: "kumar", gender: true, department: "HR", deleted_at: nil, is_primary: true, address_id: 1, organization_role_id: 1, organization_id: 1, contact_id: 1}
])
UserLoginDetail.create!([
  {email: "sriannapoorani.thoughtbees@gmail.com", password: "annapoorani", deleted_at: nil, organization_user_id: 1, tenant_id: 1}
])
TaxType.create!([
  {tax_type: "SGST", tax_division: "Intra State Tax"},
  {tax_type: "CGST", tax_division: "Intra State Tax"},
  {tax_type: "IGST", tax_division: "Inter State Tax"},
  {tax_type: "UTGST", tax_division: "Inter State Tax"}
])
GstTreatment.create!([
  {name: "Registered Business - Regular", description: "Business that is registered under GST", gst_required: true},
  {name: "Registered Business - Composition", description: "Business that is registered under the Composition scheme in GST", gst_required: true},
  {name: "unregistered Business", description: "Business that has not been registered under GST", gst_required: false},
  {name: "Consumer", description: "A customer who is a regular consumer", gst_required: false},
  {name: "Overseas", description: "Persons with whom you do import or export of supplies outside india ", gst_required: false},
  {name: "Special Economic Zone", description: "Business that is located in a special economic zone of india or a SEZ Developer ", gst_required: true}
])