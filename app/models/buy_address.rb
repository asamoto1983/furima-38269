class BuyAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :municipalities, :house_number, :build_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :municipalities, :house_number
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  validates :post_code,
            presence: true,
            format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
  validates :phone_number,
            presence: true,
            format: { with: /\A\d{10,11}\z/, message: 'は半角数値のみ登録可能です', allow_blank: true }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities,
                   house_number: house_number, build_name: build_name, phone_number: phone_number, buy_id: buy.id)
  end
end
