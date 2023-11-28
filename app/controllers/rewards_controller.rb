class RewardsController < GamesController
  def index
    @random_images = ["Reward-icon-1.png", "Reward-icon-2.png", "Reward-icon-3.png", "Reward-icon-4.png", "Reward-icon-5.png"]
    @rewards = Reward.where(child: current_child)
  end
end
