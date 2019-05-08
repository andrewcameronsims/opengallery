class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, length: { minimum: 2 }, presence: true 
  validates :phone, presence: true
  validates :address, presence: true
  validates :secret_question, presence: true
  validates :encrypted_secret, presence: true
  

  has_one_attached :avatar
end
