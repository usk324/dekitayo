require 'open-uri'

class MissionsController < GamesController
  def index
    @missions = Mission.all
  end

  def board
    set_current_child_id if params[:child_id].present?
    url = "https://api.openweathermap.org/data/2.5/weather?lat=35.6764&lon=139.6500&appid=68c7d9645dcea9731a25be00174dd457&units=metric"
    serialized = URI.open(url).read
    @weather = JSON.parse(serialized)
    @weather_icon = get_weather_icon(@weather['weather'][0]['main'])
  end

  def edit
    @mission = Mission.find(params[:id])
  end

  def update
    @mission = Mission.find(params[:id])
    @mission.update(status: "finished")
    redirect_to missions_path, notice: "Great job, you finished this mission!"
  end

  # def update_status
  #   @mission = Mission.find(params[:id])
  #   @mission.update(status: "started")
  #   redirect_to board_missions_path, notice: "Mission started!"
  # end

  private

  def set_current_child_id
    # This stores a `current_child_id` value in the session cookie
    session[:current_child_id] = params[:child_id]
  end

  def get_weather_icon(condition)
    case @weather['weather'][0]['main']
      when "Sunny" then "fa-solid fa-sun"
      when "Clouds" then "fa-solid fa-cloud"
      when "Snow" then "fa-regular fa-snowflake"
      when "Rain" then "fa-solid fa-umbrella"
      when "Thunderstorm" then "fa-solid fa-cloud-bolt"
      when "Drizzle" then "fa-solid fa-cloud-rain"
      when "Clear" then "fa-regular fa-sun"
      when "Fog" then "fa-solid fa-smog"
      when "Dust" then "fa-solid fa-smog"
      when "Mist" then "fa-solid fa-smog"
      when "Haze" then "fa-solid fa-smog"
      when "Smoke" then "fa-solid fa-smog"
      when "Tornado" then "fa-solid fa-tornado"
      end
  end

end
