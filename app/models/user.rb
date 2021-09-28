class User < ApplicationRecord
  has_many :worships, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :seals, dependent: :destroy
  has_many :worship_likes, dependent: :destroy
  has_many :seal_likes, dependent: :destroy
  has_many :liked_worships, through: :worship_likes, source: :worship
  has_many :liked_seals, through: :seal_likes, source: :seal
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
