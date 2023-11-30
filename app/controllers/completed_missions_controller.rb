class CompletedMissionsController < GamesController
  def create
    @mission = current_child.missions.find(params[:mission_id])
    @mission.update(status: "finished")
    current_child.update(coins: current_child.coins += @mission.coins)
    @completed_mission = CompletedMission.new(mission: @mission, completed_at: Time.now)
    @completed_mission.save

    # below info is needed for the render
    url = "https://api.openweathermap.org/data/2.5/weather?lat=35.6764&lon=139.6500&appid=68c7d9645dcea9731a25be00174dd457&units=metric"
    serialized = URI.open(url).read
    @weather = JSON.parse(serialized)
    @weather_icon = get_weather_icon(@weather['weather'][0]['main'])
    @sound = true
    @completed_missions = current_child.completed_missions.where(completed_at: Date.today.all_day)
    @missions = current_child.missions.where(date: Date.today.all_day)
    if @completed_missions.count == @missions.count
      @finished_sound = true
    end
    flash[:notice] = 'Mission finished successfully!'
    render "missions/board"
  end

  private

  # below info is needed for the render
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
