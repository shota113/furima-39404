class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item, :postcode, :prefecture_id, :city, :street_number, :building_name, :tel, :token
  validates :user_id, presence: true
  validates :item, presence: true


  validates :postcode, presence: true, format:{with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :prefecture_id, presence: true, numericality:{ other_than: 1 }
  validates :city, presence: true
  validates :street_number, presence: true
  validates :tel, presence: true, format:{with: /\A[0-9]{10,11}\z/}
  validates :token, presence: true
  def save
    order = Order.create(user_id: user_id, item_id: item)
    
  end
end
