class OrderDelivery

  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token,:user_id,:item_id,:post_code,:prefecture_id,:city,:house_number,:building_name,:phone_number

  validates :token, presence: true
  validates :post_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  # validates :building_name, presence: true
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: 'should be 10 or 11 digits long and contain only numbers' }
  validates :prefecture_id, numericality: { other_than: 1, message: 'must be selected' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Delivery.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end