class AddPositionToChildren < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :position, :integer
  end
end
