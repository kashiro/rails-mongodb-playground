require 'rails_helper'

describe "How to use mongoid : " do

  let!(:name) { 'example' }
  let!(:name2) { 'example2' }
  let!(:age) { 20 }
  let!(:age2) { 30 }

  before() do
    @user = User.new(name: 'example', age: 20)
    @user.save!
  end

  describe "get attribute from model instance" do

    it "user.name syntax" do
      expect(@user.name).to eq(name)
    end

    it ":symbol syntax" do
      expect(@user[:name]).to eq(name)
    end

    it "read_attribute syntax" do
      expect(@user.read_attribute(:name)).to eq(name)
    end

  end

  describe "set attribute from model instance" do

    describe "then sat attributes are not saved in db" do
      it "user.name syntax" do
        @user.name = name2
        expect(@user.name).to eq(name2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name)
      end

      it ":symbol syntax" do
        @user[:name] = name2
        expect(@user.name).to eq(name2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name)
      end

      it "write_attribute syntax" do
        @user.write_attribute(:name, name2)
        expect(@user.name).to eq(name2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name)
      end

      it "write_attributes syntax" do
        @user.write_attributes(name: name2, age: age2)
        expect(@user.name).to eq(name2)
        expect(@user.age).to eq(age2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name)
        expect(User.where(id: @user.id).first.age).to eq(age)
      end

      it "attributes syntax" do
        @user.attributes = { name: name2, age: age2 }
        expect(@user.name).to eq(name2)
        expect(@user.age).to eq(age2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name)
        expect(User.where(id: @user.id).first.age).to eq(age)
      end
    end

    describe "then sat attributes are saved in db" do
      it "update_attribute syntax" do
        @user.update_attribute(:name, name2)
        expect(@user.name).to eq(name2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name2)
      end

      it "update_attributes syntax" do
        @user.update_attributes(name: name2, age: age2)
        expect(@user.name).to eq(name2)
        expect(@user.age).to eq(age2)
        # do not save in db
        expect(User.where(id: @user.id).first.name).to eq(name2)
        expect(User.where(id: @user.id).first.age).to eq(age2)
      end
    end

  end


end
