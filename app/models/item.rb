class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_delivery_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
