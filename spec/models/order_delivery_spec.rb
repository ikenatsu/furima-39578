require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_delivery.post_code = '1234567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeが3桁ハイフン4桁の半角文字列でないと保存できない' do
        @order_delivery.post_code = '1234-567'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_delivery.prefecture_id = '1'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture must be selected")
      end
      it 'cityが空だと保存できないこと' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_delivery.house_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @order_delivery.phone_number = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は10桁以上11桁以内の半角数値でないと保存できないこと' do
        @order_delivery.phone_number = '090-1234-5678'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Phone number should be 10 or 11 digits long and contain only numbers")
      end
    end
  end
end
