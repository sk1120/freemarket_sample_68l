require 'rails_helper'

describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, family_name, first_name, family_name_kana, first_name_kana, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
    
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user).to be_valid
    end
  end
end