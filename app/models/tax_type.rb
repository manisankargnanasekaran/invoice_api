class TaxType < ApplicationRecord
	has_many :taxes
	enum tax_division: {"Intra State Tax" => 1, "Inter State Tax" => 2}
	
end
