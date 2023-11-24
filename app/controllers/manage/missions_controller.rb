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

end
