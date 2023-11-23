require 'open-uri'
class Manage::ChildrenController < ApplicationController
  layout 'manage_children/manage_children'
  before_action :set_current_child_id, only: :show

  def index
    @children = current_user.children
  end

  def show
    @current_time = Time.now
    @child = Child.find(params[:id])
    url = "https://api.openweathermap.org/data/2.5/weather?lat=35.6764&lon=139.6500&appid=68c7d9645dcea9731a25be00174dd457"
    serialized = URI.open(url).read
    @weather = JSON.parse(serialized)
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
