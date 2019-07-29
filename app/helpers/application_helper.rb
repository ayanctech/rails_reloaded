module ApplicationHelper
  def error_messages_for(object)
    #render(:partial => 'application/error_message', :locals => {:object => object })
    render 'application/error_message', object: object
  end
end
