class CreateClaimedRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :claimed_rewards do |t|
      t.references :reward, null: false, foreign_key: true
      t.datetime :claimed_at
      t.timestamps
    end
  end
end
