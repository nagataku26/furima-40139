class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :block, :building_name, :phone_number
  attr_accessor :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含む半角文字で入力してください' }
    validates :city
    validates :block
    validates :phone_number, length: { minimum: 10, maximum: 11 }, format: { with: /\A\d{10,11}\z/, message: 'は10桁または11桁の半角数字で入力してください' }

    validates :token
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end