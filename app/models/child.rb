class Child < ApplicationRecord
  # has_merit

  belongs_to :user
  has_many :missions, dependent: :destroy
  has_many :completed_missions, through: :missions, dependent: :destroy
  has_many :rewards, dependent: :destroy
  has_many :claimed_rewards, through: :rewards, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true

  def move_next
    self.position = position + 1
    save
  end

  def completed_missions_data
   data = self.missions
   .where(status: "finished")
   .where(date: ((Date.today - 30.days)..Date.today))
   .group("date").count
   (Date.today - 30.days).upto(Date.today) do |date|
    if data[date]
       next
     else
      data[date] = 0
     end
    end
    return data
  end

  def assigned_missions_data
    data = self.missions
    .where(date: ((Date.today - 30.days)..Date.today))
    .group("date").count
    (Date.today - 30.days).upto(Date.today) do |date|
      puts date
     if data[date]
        next
      else
       data[date] = 0
      end
     end
     return data
  end

end
