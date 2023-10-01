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
    order = Order.create(user)
  end
end
