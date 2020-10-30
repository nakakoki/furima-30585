require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品の購入' do
    it '全ての値が入力されていれば購入できる' do
      expect(@order).to be_valid
    end

    it '郵便番号が空だと購入できない' do
      @order.postal_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号にはハイフンがないと購入できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid')
    end

    it '都道府県が空だと購入できない' do
      @order.prefecture_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県のidが1の場合購入できない' do
      @order.prefecture_id = 1
      @order.valid?
      expect(@order.errors.full_messages).to include('Prefecture must be other than 1')
    end

    it '市区町村が空だと購入できない' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空だと購入できない' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end

    it '建物名は空でも購入できること' do
      @order.building_name = nil
      expect(@order).to be_valid
    end

    it '電話番号が空だと購入できない' do
      @order.phone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話場合はハイフンを含むと購入できない' do
      @order.phone_number = '090-1234-5678'
      @order.valid?
      expect(@order.errors.full_messages).to include('Phone number is invalid')
    end

    it 'tokenが空では購入できない' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
