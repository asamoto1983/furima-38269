require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスを入力してください'
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'メールアドレスはすでに存在します'
      end
      it 'emailに@が存在しない場合は登録できない' do
        @user.email = 'test.mail'
        @user.valid?
        expect(@user.errors.full_messages).to include 'メールアドレスは不正な値です'
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードを入力してください'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12ert'
        @user.password_confirmation = '12ert'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字の両方を含めて設定してください'
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字の両方を含めて設定してください'
      end
      it 'passwordが全角だと登録できない' do
        @user.password = '1ａ2ｂ3ｃ'
        @user.password_confirmation = '1ａ2ｂ3ｃ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードには英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '1q2w3e'
        @user.password_confirmation = '3e2w1q'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード（確認用）とパスワードの入力が一致しません'
      end
      it '名字がなければ登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名字を入力してください'
      end
      it '名前がなければ登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前を入力してください'
      end
      it '名字が全角でなければ登録できない' do
        @user.last_name = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字には全角文字を使用してください'
      end
      it '名前が全角でなければ登録できない' do
        @user.first_name = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前には全角文字を使用してください'
      end
      it '名字(カナ)がなければ登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名字(カナ)を入力してください'
      end
      it '名前(カナ)がなければ登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '名前(カナ)を入力してください'
      end
      it '名字(カナ)は全角(カタカナ)でなければ登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include '名字(カナ)には全角カタカナを使用してください'
      end
      it '名前(カナ)は全角(カタカナ)でなければ登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include '名前(カナ)には全角カタカナを使用してください'
      end
      it '生年月日がなければ登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include '生年月日を入力してください'
      end
    end
  end
end
