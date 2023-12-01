class ClaimedRewardsController < GamesController
  def create
    @reward = Reward.find(params[:reward_id])
    if current_child.coins < @reward.price
      flash[:alert] = 'Sorry, not enough coins :('
      redirect_to rewards_path
    else
      @claimed_reward = ClaimedReward.new
      @claimed_reward.reward = @reward
      @claimed_reward.save
      @reward.inventory -= 1
      current_child.coins -= @reward.price
      current_child.save
      @reward.save

      # info needed for rerender
      @rewards = Reward.where(child: current_child)
      @random_images = ["Reward-icon-1.png", "Reward-icon-2.png", "Reward-icon-3.png", "Reward-icon-4.png", "Reward-icon-5.png"]
      @sound = true
      flash[:notice] = "#{@reward.name} was purchased"
      # redirect_to rewards_path
      render "rewards/index"
    end
  end

  def update
    @claimed_reward = ClaimedReward.find(params[:id])
    @claimed_reward.read = true
    @claimed_reward.save
    redirect_to manage_child_path(current_child)
  end
end
