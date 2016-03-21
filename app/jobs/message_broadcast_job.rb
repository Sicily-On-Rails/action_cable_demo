class MessageBroadcastJob < ApplicationJob
  queue_as :default
=begin
  def perform(*args)
    # Do something later
  end
=end

  def perform
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end
  
  private
  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: {message: message})
  end
  

end
