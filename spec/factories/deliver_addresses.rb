FactoryBot.define do

  factory :deliver_address do
    zip_code              {"0000000"}
    prefecture            {"東京都"}
    city                  {"杉並区"}
    address1              {"荻窪"}
    address2              {"荻窪ハイツ"}
    telephone             {"00000000000"}
  end
end