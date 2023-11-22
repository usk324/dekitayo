class Child < ApplicationRecord
  has_merit

  belongs_to :user
  has_many :missions, dependent: :destroy
  has_many :completed_missions, through: :missions, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :claimed_rewards, through: :rewards, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true
end
