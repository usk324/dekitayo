class Mission < ApplicationRecord
  belongs_to :child
  has_many :completed_missions, dependent: :destroy
  enum status: { not_started: "not_started", started: "started", finished: "finished" }, _default: :not_started
  enum category: { chore: "chore", other: "other", responsibility: "responsibility", activity: "activity", organization: "organization", study: "study" }
  has_one_attached :photo
  after_commit :check_status, on: :update
  validates :title, presence: true
  validates :description, presence: true
  validates :coins, presence: true
  validates :status, presence: true
  validates :date, presence: true

  scope :daily_missions, -> { where(date: Date.today) }
  scope :future_missions, -> { where('date > ?', Date.today) }

  def check_status
    total_missions = child.missions.where(date: date).count
    finished_missions = child.missions.where(date: date, status: "finished").count
    if total_missions == finished_missions
      child.move_next
    end
  end
end
