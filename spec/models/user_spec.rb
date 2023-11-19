require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname、email、password、password_confirmation、および名前(全角)、名前カナ(全角)、生年月日の情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複するemailは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が無いと保存できない' do
        @user.email = 'testtest.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが空では保存できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'sampletest'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '12345678'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordに全角文字を含むと登録できない' do
        @user.password = 'サンプルtest1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid. Include both letters and numbers'
      end
      it 'passwordとpassword_confirmationが不一致では保存できない' do
        @user.password = 'asdfghj1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordが6文字未満では保存できない' do
        @user.password = '1asd'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'last_nameが空では保存できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end
      it 'first_nameが空では保存できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end
      it 'last_name_kanaが空では保存できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'first_name_kanaが空では保存できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_nameが漢字・ひらがな・かたかな以外では保存できない' do
        @user.last_name = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid. Input full-width characters.'
      end
      it 'first_nameが漢字・ひらがな・かたかな以外では保存できない' do
        @user.first_name = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid. Input full-width characters.'
      end
      it 'last_name_kanaが全角（カタカナ）以外では保存できない' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid. Input full-width katakana characters.'
      end
      it 'first_name_kanaが全角（カタカナ）以外では保存できない' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid. Input full-width katakana characters.'
      end
      it 'birth_dayが空では保存できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end
end
