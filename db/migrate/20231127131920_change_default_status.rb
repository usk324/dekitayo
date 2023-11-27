class ChangeDefaultStatus < ActiveRecord::Migration[7.0]
  def change
    change_column :missions, :status, :string, null: false, default: "incomplete"
  end
end
