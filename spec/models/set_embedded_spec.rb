require 'rails_helper'

describe "set embedded attributes : " do

  describe "set embedded instance using dot syntax" do
    before() do
      @user = User.new(name: 'example', age: 20)
      @address = Address.new(zipcode: "000-0000", street: "street name")
      @user.address = @address
    end

    it "before save. These data is not saved in db" do
      expect(User.where(id: @user.id).size).to eq(0)
    end
    it "after save. These data is saved in db" do
      @user.save!
      expect(User.where(id: @user.id).size).to eq(1)
    end
  end

  it "set embedded using build_#field_name syntax" do
    @user = User.new(name: 'example', age: 20)
    @user.build_address(zipcode: "000-0000", street: "street name")
    expect(@user.address.zipcode).to eq("000-0000")
    expect(@user.address.street).to eq("street name")

    # is not saved in db
    expect(User.where(id: @user.id).size).to eq(0)
    @user.save!
    # is saved in db
    expect(User.where(id: @user.id).size).to eq(1)
  end

  it "set embedded using create_#field_name syntax" do
    @user = User.new(name: 'example', age: 20)
    @user.create_address(zipcode: "000-0000", street: "street name")
    expect(@user.address.zipcode).to eq("000-0000")
    expect(@user.address.street).to eq("street name")

    # not saved in db
    expect(User.where(id: @user.id).size).to eq(1)
  end

  it "update attribute" do
    @user = User.new(name: 'example', age: 20)
    @user.create_address(zipcode: "000-0000", street: "street name")

    # is saved in db
    expect(User.where(id: @user.id).size).to eq(1)

    # is not saved in db
    @user.address.zipcode = "111-1111"
    expect(User.where(id: @user.id).first.address.zipcode).not_to eq("111-1111")

    # is not saved in db
    @user.address.write_attribute(:zipcode, "222-2222")
    expect(User.where(id: @user.id).first.address.zipcode).not_to eq("222-2222")

    # is saved in db
    @user.address.update_attribute(:zipcode, "333-3333")
    expect(User.where(id: @user.id).first.address.zipcode).to eq("333-3333")
  end
end
