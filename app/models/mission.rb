class Mission < ApplicationRecord
  belongs_to :child
  has_many :completed_missions
  enum status: { not_started: "not_started", started: "started", finished: "finished" }, _default: :not_started
  enum category: { chore: "chore", other: "other", responsibility: "responsibility", activity: "activity", organization: "organization", study: "study" }
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :coins, presence: true
  validates :status, presence: true
end
