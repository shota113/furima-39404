class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item, :postcode, :prefecture_id, :city, :street_number, :building_name, :tel, :token
  with_options presence: true do
    validates :user_id, presence: true
    validates :item, presence: true

    validates :postcode, presence: true, format:{with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, presence: true, numericality:{ other_than: 1 }
    validates :city, presence: true
    validates :street_number, presence: true
    validates :tel, presence: true, format:{with: /\A[0-9]{10,11}\z/}

    validates :token, presence: true
  end

  def save
    order = Order.create(user_id: user_id, item_id: item)
    Address.create(order_id:order.id, postcode: postcode, prefecture_id: prefecture_id, city: city, street_number: street_number, building_name: building_name, tel: tel )
  end
end
