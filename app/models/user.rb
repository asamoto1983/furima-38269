class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email,                   presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :encrypted_password,      presence: true, length: { minimum: 6 }
  validates :nickname,                presence: true
  validates :first_name,              presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name,               presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana,         presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :last_name_kana,          presence: true, format: { with: /\A[ァ-ヶ]+\z/ }
  validates :birth_day,               presence: true

  has_many :buys
  has_many :products
  
end
