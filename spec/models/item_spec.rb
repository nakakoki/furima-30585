require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    it 'ログインしていて、商品名、画像、説明、カテゴリー、状態、配送料、地域、日数、価格があれば登録できる' do
      expect(@item).to be_valid
    end

    it 'ユーザーはログインしていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end

    it '商品名が空だと登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'imageの画像が空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品の説明が空だと登録できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報が選択されていないと登録できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'カテゴリーのidが1の場合登録できない' do
      @item.category_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品の状態が選択されていないと登録できない' do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '商品の状態のidが1の場合登録できない' do
      @item.condition_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition is not a number')
    end

    it '配送料についての情報が選択されていないと登録できない' do
      @item.shipping_charge_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end

    it '配送料についてのidが1の場合登録できない' do
      @item.shipping_charge_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charge is not a number')
    end

    it '発送元の地域の情報が選択されていないと登録できない' do
      @item.prefectures_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end

    it '発送元の地域のidが1の場合登録できない' do
      @item.prefectures_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefectures is not a number')
    end

    it '発送までの日数の情報が選択されていないと登録できない' do
      @item.days_to_ship_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship can't be blank")
    end

    it '発送までの日数のidが1の場合登録できない' do
      @item.days_to_ship_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship is not a number')
    end

    it '価格の情報が空だと登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格の範囲が￥300~￥9,999,999の間であれば登録できる' do
      @item.price = '999'
      expect(@item).to be_valid
    end

    it '価格は半角数字の入力でなければ登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end
  end
end
