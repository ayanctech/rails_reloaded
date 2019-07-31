module ApplicationHelper
  def error_messages_for(object)
    render "application/error_message", object: object
  end
end
