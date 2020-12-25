require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できる時' do
      it 'name, email, password, password_confirmation, first_name, last_name, first_name_kana, last_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'First_name_kanaが全角カタカナであれば、登録できる' do
        expect(@user).to be_valid
      end

      it 'Last_name_kanaが全角カタカナであれば、登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
      it 'nicknameの値が空だと、DBに保存できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailの値が空だと、DBに保存できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordの値が空だと、DBに保存できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'first_nameの値が空だと、DBに保存できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name 全角文字を使用してください')
      end

      it 'last_nameの値が空だと、DBに保存できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name 全角文字を使用してください')
      end

      it 'first_name_kanaの値が空だと、DBに保存できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana 全角文字を使用してください')
      end

      it 'last_name_kanaの値が空だと、DBに保存できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana 全角文字を使用してください')
      end

      it 'birthdayの値が空だと、DBに保存できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123aaa'
        @user.password_confirmation = '123aaa'
        expect(@user).to be_valid
      end

      it 'passwordが5文字以下だと登録できない' do
        @user.password = '123aa'
        @user.password_confirmation = '123aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角数字を最低一つ含まないと、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordが半角数字を最低一つ含まないと、登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end

      it 'passwordとpassword_confirmationが一致していないと、登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaab'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが@を含んでいないと登録できない' do
        @user.email = 'test gmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'First_nameが全角文字でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end

      it 'Last_nameが全角文字でないと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
    end
  end
end
