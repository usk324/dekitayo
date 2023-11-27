class Manage::ChildrenController < ApplicationController
  layout 'manage_children/manage_children'

  def index
    @children = current_user.children
  end

  def show
    @children = current_user.children
    @child = Child.find(params[:id])
    @mission = Mission.new()
  end

  def new
    @child = Child.new()
    @child.user = current_user
  end

  def create
    @child = Child.new(child_params)
    @child.user = current_user

    if @child.save
      redirect_to manage_child_path(@child.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def child_params
    params.require(:child).permit(:name, :date_of_birth, :photo)
  end
end
