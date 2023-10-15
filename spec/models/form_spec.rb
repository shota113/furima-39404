require 'rails_helper'
RSpec.describe Form, type: :model do
  before do
    @user = FactoryBot.create(:user) 
    @item = FactoryBot.create(:item, user: @user)
    @form = FactoryBot.build(:form, user_id: @user, item_id: @item)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存' do
      it '全ての値が正しく入力されtokenが存在する場合は保存できる' do
        expect(@form).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の半角文字列であれば保存できる' do
        @form.postcode = '123-4567'
        expect(@form).to be_valid
      end
      it '電話番号が10桁以上11桁以内の半角数字であれば保存できる' do
        @form.tel = '12345678912'
        expect(@form).to be_valid
      end
      it '建物名が空でも保存できる' do
        @form.building_name = nil
        expect(@form).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it '郵便番号が空欄だと保存できない' do
        @form.postcode = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @form.postcode = '1234567'
        @form.valid?
        expect(@form.errors.full_messages).to include("Postcode is invalid")
      end
      it '電話番号が9桁以下では購入できない' do
        @form.tel = '12345678'
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が12桁以上では購入できない' do
        @form.tel = '123456789987'
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合購入できない' do
        @form.tel = 'あKk23.;'
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel is invalid")
      end
      it 'prefectureが空欄だと保存できない' do
        @form.prefecture_id = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが「---」だと保存できない' do
        @form.prefecture_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'cityが空欄だと保存できない' do
        @form.city = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("City can't be blank")
      end
      it 'street_numberが空欄だと保存できない' do
        @form.street_number = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Street number can't be blank")
      end
      it 'telが空欄だと保存できない' do
        @form.tel = ''
        @form.valid?
        expect(@form.errors.full_messages).to include("Tel can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていなければ購入できない" do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できない" do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end