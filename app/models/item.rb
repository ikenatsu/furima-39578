# class Item < ApplicationRecord
#   belongs_to :user
#   has_one_attached :image

#   validates :image, presence: true
#   validates :item_name, presence: true
#   validates :comment, presence: true
#   validates :price, presence: true
  
#   validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_duration_id, numericality: { other_than: 1, message: 'must be selected'}
#   validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'must be between 300 and 9,999,999' }
#   validates :price, format: { with: /\A[0-9]+\z/, message: ' is not a number' }

#   extend ActiveHash::Associations::ActiveRecordExtensions
#   belongs_to :category
#   belongs_to :condition
#   belongs_to :shipping_cost
#   belongs_to :prefecture
#   belongs_to :shipping_duration

# end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_duration

  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :comment
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'must be between 300 and 9,999,999' }
    validates :price, format: { with: /\A[0-9]+\z/, message: ' is not a number' }
  end

  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_duration_id, numericality: { other_than: 1, message: 'must be selected'}

end