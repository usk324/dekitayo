class CreateChildren < ActiveRecord::Migration[7.0]
  def change
    create_table :children do |t|
      t.string :name
      t.date :date_of_birth
      t.integer :coins
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
