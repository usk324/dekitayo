class CompletedMissionsController < GamesController
  def create
    @mission = current_child.missions.find(params[:mission_id])
    @mission.update(status: "finished")
    @completed_mission = CompletedMission.new(mission: @mission, completed_at: Time.now)
    @completed_mission.save
    flash[:notice] = 'Mission finished successfully!'
    redirect_to board_missions_path
  end
end
