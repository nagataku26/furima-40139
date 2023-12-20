class Address < ApplicationRecord
  belongs_to :order

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含む半角文字で入力してください' }
  validates :prefecture_id, resence: true
  validates :city, resence: true
  validates :block, resence: true
  validates :phone_number, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true}
end
