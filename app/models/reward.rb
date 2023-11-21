class Reward < ApplicationRecord
  belongs_to :child
  has_many :claimed_rewards
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
end
