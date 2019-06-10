class MessagesController < ApplicationController
  before_action :params_message, only: [:create]
  before_action :find_event, only: [:create]

  def index
    @event = Event.find(params[:event_id])
    @messages = policy_scope(Message)
    authorize @event
  end

  def create
    @message = Message.new(params_message)
    @message.event = @event
    @message.user = current_user
    if @message.save
      respond_to do |format|
        format.html { redirect_to event_path(@event) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'events/show' }
        format.js
      end
    end
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def params_message
    params.require(:message).permit(:content)
  end
end
