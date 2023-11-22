class ChangeMissionDateType < ActiveRecord::Migration[7.0]
  def change
    change_column :missions, :date, :date
  end
end
