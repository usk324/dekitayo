class ClaimedRewardsController < GamesController
  def create
    @reward = Reward.find(params[:reward_id])
    if current_child.coins <= @reward.price
      redirect_to rewards_path(current_child), notice: 'Sorry, not enough coins :('
    else
      @claimed_reward = ClaimedReward.new
      @claimed_reward.reward = @reward
      @claimed_reward.save
      @reward.inventory -= 1
      current_child.coins -= @reward.price
      current_child.save
      @reward.save
      redirect_to rewards_path(current_child)
    end
  end

  def update
    @claimed_reward = ClaimedReward.find(params[:id])
    @claimed_reward.read = true
    @claimed_reward.save
    redirect_to manage_child_path(current_child)
  end
end
