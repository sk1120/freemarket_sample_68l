require 'rails_helper'

describe DeliverAddress do
  describe '#create' do

    it "is valid with a family_name2, first_name2, family_name_kana2, first_name_kana2, zip_code, prefecture, city, address1" do
      deliver_address = build(:deliver_address)
      expect(deliver_address).to be_valid
    end

    
  end
end