require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy_address = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
    sleep(0.1)
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it '必須項目が存在すれば購入できる' do
        expect(@buy_address).to be_valid
      end
      it '建物名がなくても購入できる' do
        @buy_address.build_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'userが紐付いていれば購入できない' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include 'Userを入力してください'
      end

      it 'itemが紐付いていれば購入できない' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include 'Itemを入力してください'
      end

      it '郵便番号がなければ購入できない' do
        @buy_address.post_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '郵便番号を入力してください'
      end

      it '郵便番号は3桁ハイフン4桁でなければ購入できない' do
        @buy_address.post_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '郵便番号が正しくありません ハイフン(-)を含めて半角文字で入力してください'
      end

      it '郵便番号は半角文字列でなければ購入できない' do
        @buy_address.post_code = '１２３−４５６７'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '郵便番号が正しくありません ハイフン(-)を含めて半角文字で入力してください'
      end

      it '都道府県が未選択では購入できない' do
        @buy_address.prefecture_id = '1'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '都道府県を入力してください'
      end

      it '市区町村がければ購入できない' do
        @buy_address.municipalities = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '市区町村を入力してください'
      end
      it '番地がなければ購入できない' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '番地を入力してください'
      end

      it '電話番号がなければ購入できない' do
        @buy_address.phone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '電話番号を入力してください'
      end

      it '電話番号が9桁以下では購入できない' do
        @buy_address.phone_number = '123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '電話番号が正しくありません 電話番号は半角数値のみ登録可能です'
      end

      it '電話番号が12桁以上では購入できない' do
        @buy_address.phone_number = '012345678910'
        @buy_address.valid?

        expect(@buy_address.errors.full_messages).to include '電話番号が正しくありません 電話番号は半角数値のみ登録可能です'
      end

      it '電話番号にハイフンがあると購入できない' do
        @buy_address.phone_number = '03-1234-5678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '電話番号が正しくありません 電話番号は半角数値のみ登録可能です'
      end

      it '電話番号に全角数値があると購入できない' do
        @buy_address.phone_number = '０３１２３４５６７８'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include '電話番号が正しくありません 電話番号は半角数値のみ登録可能です'
      end

      it 'トークンがないと購入できない' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include 'クレジットカード情報を入力してください'
      end
    end
  end
end
