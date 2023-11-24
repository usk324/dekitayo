class Manage::MissionsController < ApplicationController
  layout 'manage_children/manage_children'
  def index
    @child = Child.find(params[:child_id])
    @missions = @child.missions
  end

  def new
  end

  def create
  end

  def mark_as_finished
    @child = Child.find(params[:child_id])
    @mission = @child.missions.find(params[:mission_id])
    @mission.update(status: "finished")
    flash[:notice] = 'Mission finished successfully!'
    redirect_to manage_child_path(@child)
  end
end
