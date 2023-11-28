class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :children, :favorite_reward, :integer
  end
end
