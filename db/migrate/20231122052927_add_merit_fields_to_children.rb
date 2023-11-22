class AddMeritFieldsToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :sash_id, :integer
    add_column :children, :level,   :integer, :default => 0
  end
end
