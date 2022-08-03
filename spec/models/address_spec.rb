require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it '入力が完了していれば購入できる' do
        expect(@address).to be_valid
      end

      it '建物名がなくても購入できる' do
        @address.build_name = ''
        expect(@address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号がなければ購入できない' do
        @address.post_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Post code can't be blank", 'Post code is invalid. Include hyphen(-)'
      end

      it '郵便番号は3桁ハイフン4桁でなければ購入できない' do
        @address.post_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include 'Post code is invalid. Include hyphen(-)'
      end

      it '郵便番号は半角文字列でなければ購入できない' do
        @address.post_code = '１２３−４５６７'
        @address.valid?
        expect(@address.errors.full_messages).to include 'Post code is invalid. Include hyphen(-)'
      end

      it '都道府県が未選択では購入できない' do
        @address.prefecture_id = '1'
        @address.valid?
        expect(@address.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '市区町村がければ購入できない' do
        @address.municipalities = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it '市区町村がければ購入できない' do
        @address.municipalities = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Municipalities can't be blank"
      end

      it '番地がなければ購入できない' do
        @address.house_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "House number can't be blank"
      end

      it '電話番号がなければ購入できない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include "Phone number can't be blank", 'Phone number は半角数値のみ登録可能です'
      end

      it '電話番号が10桁より少なければ購入できない' do
        @address.phone_number = '061234567'
        @address.valid?
        expect(@address.errors.full_messages).to include 'Phone number は半角数値のみ登録可能です'
      end

      it '電話番号にハイフンがあると購入できない' do
        @address.phone_number = '03-1234-5678'
        @address.valid?
        expect(@address.errors.full_messages).to include 'Phone number は半角数値のみ登録可能です'
      end

      it '電話番号に全角数値があると購入できない' do
        @address.phone_number = '０３１２３４５６７８'
        @address.valid?
        expect(@address.errors.full_messages).to include 'Phone number は半角数値のみ登録可能です'
      end
    end
  end
end
