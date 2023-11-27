class ClaimedRewardsController < GamesController
  def create
    @reward = Reward.find(params[:reward_id])
    @child = Child.find(params[:child_id])
    if @child.coins <= @reward.price
      redirect_to rewards_path(@child), notice: 'Sorry, not enough coins :('
    else
      @claimed_reward = ClaimedReward.new
      @claimed_reward.reward = @reward
      @claimed_reward.save
      @reward.inventory -= 1
      @child.coins -= @reward.price
      @child.save
      @reward.save
      redirect_to rewards_path(@child)
    end
  end
end
