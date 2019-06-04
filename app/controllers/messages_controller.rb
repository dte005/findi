class MessagesController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @messages = policy_scope(Message)
    authorize @event
  end
end
