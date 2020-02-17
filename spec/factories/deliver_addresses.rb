FactoryBot.define do

  factory :deliver_address do
    family_name2           {"新"}
    first_name2            {"谷"}
    family_name_kana2      {"しん"}
    first_name_kana2       {"たに"}
    zip_code               {"0000000"}
    prefecture             {"東京都"}
    city                   {"杉並区"}
    address1               {"荻窪"}
    address2               {"荻窪ハイツ"}
    telephone              {"00000000000"}
  end
end