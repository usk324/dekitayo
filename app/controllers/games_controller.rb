class GamesController < ApplicationController
  layout "game"
  before_action :redirect_to_child_selection, unless: :current_child

  private

  def current_child
    return unless current_user && (session[:current_child_id].present? || params[:child_id].present?)

    # We store the child instance in an @instance_variable so that it can be used in the view
    @current_child ||= current_user.children.find(params[:child_id] || session[:current_child_id])
  end

  def redirect_to_child_selection
    redirect_to manage_children_path unless params[:child_id].present?
  end

end
