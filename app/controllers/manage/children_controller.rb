class Manage::ChildrenController < ApplicationController
  def new
    @child = Child.new()
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

  def show
  end

  def index
  end

  private

  def child_params
    params.require(:child).permit(:name, :date_of_birth, :photo)
  end
end
