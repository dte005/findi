class MessagesController < ApplicationController
  before_action :params_message, only: [:create]
  before_action :find_event, only: [:create]

  def index
    @event = Event.find(params[:event_id]) #preciso pegar o evento para restringir o acesso ao usuario errado
    @messages = policy_scope(Message)
    authorize @event #restringindo o acesso
  end

  def create
    @message = Message.new(params_message)
    @message.event = @event
    @message.user = current_user
    if @message.save
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
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
