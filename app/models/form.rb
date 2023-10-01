class Form
  include ActiveModel::Model
  attr_accessor :user, :item, :postcode, :shipment_id, :city, :block, :building, :phonenumber,

  validates :user
  validates :item


  validates :postcode
  validates :shipment_id
  validates :city
  validates :block
  validates :phonenumber
  def save
    # 各テーブルにデータを保存する処理を書く
  end
end