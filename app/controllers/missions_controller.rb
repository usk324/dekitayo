class MissionsController < GamesController

  def index
    @missions = Mission.all
  end

  def show
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def current_child
    return unless current_user && session[:current_child_id].present?

    # We store the child instance in an @instance_variable so that it can be used in the view
    @current_child ||= current_user.children.find(session[:current_child_id])
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.update(status: "finished")
    redirect_to missions_path, notice: "Great job, you finished this mission!"
  end

  def board
  end
end
