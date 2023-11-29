class Manage::MissionsController < ApplicationController
  layout 'manage_children/manage_children'
  def index
    @child = Child.find(params[:child_id])
    @missions = @child.missions
    @missions_due_today = @misssions.where(date: Date.today).count
    @missions_done_today = @missions.where(status: "finished").count
  end

  def new
    @mission = Mission.new()
  end

  def create
    @mission = Mission.new(mission_params)
    @child = Child.find(params[:child_id])
    @mission.child = @child
    # respond_to do |format|
      # if @mission.save
        # format.js
        # format.html
      # else
        # format.js { render :new }
        # format.html
      # end
    # end
    @mission.save
    redirect_to manage_child_path(@child)

  end

  private

  def mission_params
    params.require(:mission).permit(:title, :description, :date, :coins, :category, :required_photo, :photo)
  end

end
