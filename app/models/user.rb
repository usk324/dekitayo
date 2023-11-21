class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children, dependent: :destroy
  has_many :missions, through: :children, dependent: :destroy
  has_many :rewards, through: :children, dependent: :destroy
  has_many :completed_missions, through: :missions, dependent: :destroy
  has_many :claimed_rewards, through: :rewards, dependent: :destroy
  has_one_attached :photo
end
