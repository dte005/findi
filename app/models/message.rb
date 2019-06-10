class Message < ApplicationRecord
  belongs_to :event
  belongs_to :user
  after_create :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast("chat_#{event.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "events/message",
        locals: { message: self, user_is_messages_author: false }
      ),
      current_user_id: user.id
    })
  end
end
