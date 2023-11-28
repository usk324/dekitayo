class ChangePositionInChildren < ActiveRecord::Migration[7.0]
  def change
    change_column :children, :position, :integer, null: false, default: 1
  end
end
