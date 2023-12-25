class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :order

  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフンを含む半角文字で入力してください' }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city, resence: true
  validates :block, resence: true
  validates :phone_number, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true}
end
