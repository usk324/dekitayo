module ApplicationHelper
  def current_child
    @current_child
  end

  def status_color_class(status)
    case status
    when "finished"
      "finished-status"
    when "started"
      "started-status"
    else
      ""
    end
  end

end
