class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_to_ship
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :prefectures_id, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
  validates :image, presence: true

  validates :category_id, :condition_id, :shipping_charge_id, :prefectures_id, :days_to_ship_id, numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
