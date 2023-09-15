class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :buyer
  belongs_to :user_id
  belongs_to :category_id
  belongs_to :cost_id
  belongs_to :prefecture_id
  belongs_to :shipment_id

  validates :name, presence: true
  validates :user, presence: true,foreign_key: true
  validates :price, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :shipment_id, presence: true
  validates :prefecture_id, presence: true
  validates :cost_id, presence: true
end
