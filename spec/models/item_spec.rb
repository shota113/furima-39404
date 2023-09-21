require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品登録' do
    context '出品登録できるとき' do
      it 'item,user,price,content,shipment_id,category_id,condition_id,prefecture_id,cost_idが入力されている場合は出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品登録ができないとき' do
      it 'nameが空欄だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'contentが空欄だと出品できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'categoryが空欄だと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'conditionが空欄だと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it 'costが空欄だと出品できない' do
        @item.cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost can't be blank")
      end
      it 'prefectureが空欄だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipmentが空欄だと出品できない' do
        @item.shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment can't be blank")
      end
      it 'priceが空欄だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'categoryが「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'conditionが「---」だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it 'shipmentが「---」だと出品できない' do
        @item.shipment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment must be other than 1")
      end
      it 'prefectureが「---」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'costが「---」だと出品できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 1")
      end
      it 'priceの範囲が、300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceの範囲が9,999,999円を超えると出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
