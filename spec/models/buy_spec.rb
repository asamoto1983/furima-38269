require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buy_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入機能' do
    context '商品購入ができるとき' do
      it 'itemとuserが紐付いていれば購入できる' do
        expect(@buy).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'userが紐付いていれば購入できない' do
        @buy.user_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていれば購入できない' do
        @buy.item_id = nil
        @buy.valid?
        expect(@buy.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
