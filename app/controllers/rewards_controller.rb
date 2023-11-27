class RewardsController < GamesController
  def index
    @random_images = ["Reward-icon-1.png", "Reward-icon-2.png", "Reward-icon-3.png", "Reward-icon-4.png", "Reward-icon-5.png", "Reward-icon-6.png", "Reward-icon-7.png", "Reward-icon-8.png"]
    @rewards = Reward.where(child: current_child)
  end
end
