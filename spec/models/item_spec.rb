require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    sleep(0.1)
  end

  describe '商品出品登録' do
    context '出品登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品登録できないとき' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include '画像を入力してください'
      end
      it '商品名が空では登録できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品名を入力してください'
      end
      it '商品の説明が空では登録できない' do
        @item.explain = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の説明を入力してください'
      end
      it 'カテゴリーが未選択では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーを入力してください'
      end
      it '商品の状態が未選択では登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態を入力してください'
      end
      it '配送料の負担が未選択では登録できない' do
        @item.del_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担を入力してください'
      end
      it '発送元の地域が未選択では登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域を入力してください'
      end
      it '発送までの日数が未選択では登録できない' do
        @item.del_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数を入力してください'
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include '価格を入力してください'
      end
      it '価格が半角数字でなければ登録できない' do
        @item.price = '１２３４５'
        @item.valid?

        expect(@item.errors.full_messages).to include '価格は数値で入力してください'
      end
      it '価格が¥300以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は300以上の値にしてください'
      end
      it '価格が¥9,999,999以上では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は9999999以下の値にしてください'
      end
      it 'ユーザー情報がない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
    end
  end
end
