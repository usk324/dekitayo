class AddReadToClaimedRewards < ActiveRecord::Migration[7.0]
  def change
    add_column :claimed_rewards, :read, :boolean, default: false
  end
end
