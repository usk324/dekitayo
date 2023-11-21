class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :inventory
      t.references :child, null: false, foreign_key: true

      t.timestamps
    end
  end
end
