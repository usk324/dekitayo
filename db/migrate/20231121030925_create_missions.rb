class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.string :title
      t.string :description
      # t.date :due_date
      t.string :status
      t.integer :coins
      t.references :child, null: false, foreign_key: true
      t.string :category
      t.boolean :required_photo, default: false, null: false

      t.timestamps
    end
  end
end
