require 'open-uri'

class MissionsController < GamesController
  def index
    @missions = Mission.all
  end

  def board
    set_current_child_id if params[:child_id].present?
    url = "https://api.openweathermap.org/data/2.5/weather?lat=35.6764&lon=139.6500&appid=68c7d9645dcea9731a25be00174dd457"
    serialized = URI.open(url).read
    @weather = JSON.parse(serialized)
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.update(status: "finished")
    redirect_to missions_path, notice: "Great job, you finished this mission!"
  end

  private

  def set_current_child_id
    # This stores a `current_child_id` value in the session cookie
    session[:current_child_id] = params[:child_id]
  end
end
