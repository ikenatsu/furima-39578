require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担先、発送元の地域、発送までの日数、販売価格の情報があれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では出品できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'commentが空では出品できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Comment can't be blank"
      end
      it 'categoryが空では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be selected'
      end
      it 'conditionが空では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be selected'
      end
      it 'shipping_costが空では出品できない' do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping cost must be selected'
      end
      it 'prefectureが空では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be selected'
      end
      it 'shipping_durationが空では出品できない' do
        @item.shipping_duration_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping duration must be selected'
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが300未満の値では出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be between 300 and 9,999,999'
      end
      it 'priceが9999999より大きい値では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be between 300 and 9,999,999'
      end
      it 'priceの値が全角では出品できない' do
        @item.price = '値段'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be between 300 and 9,999,999'
      end
      it 'ユーザーが紐づいていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
