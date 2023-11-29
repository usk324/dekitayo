class CompletedMissionsController < GamesController
  def create
    @mission = current_child.missions.find(params[:mission_id])
    @mission.update(status: "finished")
    current_child.update(coins: current_child.coins += @mission.coins)
    @completed_mission = CompletedMission.new(completed_mission_params)
    @completed_mission.mission = @mission
    @completed_mission.completed_at = DateTime.now
    @completed_mission.save
    flash[:notice] = 'Mission finished successfully!'
    # redirect_to board_missions_path
  end

  private

  def completed_mission_params
    params.require(:completed_mission).permit(:completed_latitude, :completed_longitude)
  end
end
