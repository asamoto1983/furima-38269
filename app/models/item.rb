class Item < ApplicationRecord
  validates :item,            presence: true
  validates :price,           presence: true
  validates :explain ,        presence: true
  validates :category_id,     presence: true
  validates :condition_id,    presence: true
  validates :del_charge_id,   presence: true
  validates :prefecture_id,   presence: true
  validates :del_day_id,      presence: true

  belongs_to :user
  #has_one :buy
  has_one_attached :image
end
