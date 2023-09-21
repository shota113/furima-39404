class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :buyer
  belongs_to :user
  belongs_to :category
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :shipment
  has_one_attached :image

  validates :name, presence: true
  validates :user, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :content, presence: true
  validates :category_id, presence: true, numericality:{ other_than: 1 }
  validates :condition_id, presence: true, numericality:{ other_than: 1 }
  validates :shipment_id, presence: true, numericality:{ other_than: 1 }
  validates :prefecture_id, presence: true, numericality:{ other_than: 1 }
  validates :cost_id, presence: true, numericality:{ other_than: 1 }
  validates :image, presence: true

end
