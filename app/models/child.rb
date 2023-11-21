class Child < ApplicationRecord
  belongs_to :user
  has_many :missions
  has_many :completed_missions, through: :missions
  has_many :rewards
  has_many :claimed_rewards, through: :rewards
  has_one_attached :photo

  validates :name, presence: true
end
