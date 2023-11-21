class CreateCompletedMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :completed_missions do |t|
      t.references :mission, null: false, foreign_key: true
      t.datetime :completed_at
      t.float :completed_latitude
      t.float :completed_longitude

      t.timestamps
    end
  end
end
