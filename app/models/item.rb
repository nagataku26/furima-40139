class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :days_delivery

  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :days_delivery_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: "は半角数字のみ入力してください" }
  validates :image, presence: true
end
