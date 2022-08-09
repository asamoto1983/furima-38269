class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_KANA = /\A[ァ-ヶー]+\z/

  validates :password,                presence: true,
                                      format: { with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', allow_blank: true }
  validates :nickname,                presence: true
  validates :first_name,              presence: true, format: { with: VALID_NAME, message: 'には全角文字を使用してください', allow_blank: true }
  validates :last_name,               presence: true, format: { with: VALID_NAME, message: 'には全角文字を使用してください', allow_blank: true }
  validates :first_name_kana,         presence: true,
                                      format: { with: VALID_KANA, message: 'には全角カタカナを使用してください', allow_blank: true }
  validates :last_name_kana,          presence: true,
                                      format: { with: VALID_KANA, message: 'には全角カタカナを使用してください', allow_blank: true }
  validates :birth_day,               presence: true

  has_many :items
  has_many :buys
end
