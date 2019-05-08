class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :full_name, length: { minimum: 2 }, presence: true 
  validates :phone, presence: true
  validates :address, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :secret_question, presence: true
  validates :encrypted_secret, presence: true
  validates :tags, presence: true

  has_one_attached :avatar
end


# class Piece < ApplicationRecord
#   validates :name, presence: true
#   validates :price, presence: true
#   validates :materials, presence: true
#   validates :dimensions, presence: true
#   validates :description, presence: true
#   validates :tags, presence: true
#   validates :uploaded_image, presence: true

#   belongs_to :user, optional: true
#   belongs_to :workshop

#   has_one_attached :uploaded_image
