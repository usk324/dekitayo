class ChildrenController < ApplicationController
  def update
    current_child.update(child_params)
    @rewards = current_child.rewards
    @favorite_reward = Reward.find(current_child.favorite_reward)
    redirect_to rewards_path(current_child), notice: "Changed #{@favorite_reward.name} to favorite reward"
  end

  private

  def child_params
    params.require(:child).permit(:favorite_reward)
  end

  def current_child
    current_user.children.find(params[:id])
  end
end
