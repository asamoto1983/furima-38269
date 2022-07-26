class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :del_charge
  belongs_to :prefecture
  belongs_to :del_day

  validates :image,           presence: true
  validates :item,            presence: true
  validates :explain,         presence: true
  with_options numericality: { other_than: 1, message: 'を入力してください' } do
    validates :category_id
    validates :condition_id
    validates :del_charge_id
    validates :prefecture_id
    validates :del_day_id
  end
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: 'を入力してください' }
  end

  belongs_to :user
  has_one :buy
  has_one_attached :image
end
