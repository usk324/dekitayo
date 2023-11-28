class Manage::MissionsController < ApplicationController
  layout 'manage_children/manage_children'
  def index
    @child = Child.find(params[:child_id])
    @missions = @child.missions
  end

  def new
    @mission = Mission.new()
  end

  def create
    @mission = Mission.new(mission_params)
    @child = Child.find(params[:child_id])
    @mission.child = @child
    respond_to do |format|
      if @mission.save
        format.html
        format.js
      else
        format.html
        format.js { render :new }
      end
    end
  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :date, :coins, :category, :required_photo, :photo)
  end

end
