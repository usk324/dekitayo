class Manage::MissionsController < ApplicationController
  layout 'manage_children/manage_children'
  def new
    @mission = Mission.new()
  end

  def create
    @mission = Mission.new(mission_params)

    respond_to do |format|
      if @mission.save
        format.js
      else
        format.js { render :new }
      end
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :date, :coins, :category, :required_photo, :photo)
  end
end
