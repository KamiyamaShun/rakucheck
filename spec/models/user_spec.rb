require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録できるとき' do
      it 'すべて入力すると登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき' do
      it 'shop_nameが空だと登録できない' do
        @user.shop_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("店舗名を入力してください")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      
      it 'password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordとpassword_confirmationが一致していなければ登録できない' do
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'passwordは5文字では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end

      it '既に登録されたemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end

      it 'emailに@がなければ登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
    end
  end
end
