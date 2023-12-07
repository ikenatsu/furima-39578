class OrderDelivery
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'should be 10 or 11 digits long and contain only numbers' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'must be selected' }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id:, item_id:)
    Delivery.create(post_code:, prefecture_id:, city:, house_number:,
                    building_name:, phone_number:, order_id: order.id)
  end
end
