class MessagesController < ApplicationController

  def index
    @event = Event.find(params[:event_id]) #preciso pegar o evento para restringir o acesso ao usuario errado
    @messages = policy_scope(Message)
    authorize @event #restringindo o acesso
  end
end
