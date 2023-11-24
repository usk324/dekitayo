class AddDueDateToMissions < ActiveRecord::Migration[7.0]
  def change
    add_column :missions, :due_date, :date
  end
end
