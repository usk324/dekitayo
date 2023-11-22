class Manage::ChildrenController < ApplicationController
  before_action :set_current_child_id, only: :show

  def index
    @children = current_user.children

  end

  def show
  end


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

  private

  def set_current_child_id
    # This stores a `current_child_id` value in the session cookie
    session[:current_child_id] = params[:id]
  end

  def child_params
    params.require(:child).permit(:name, :date_of_birth, :photo)
  end
end
