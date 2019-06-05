class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]
  #before_action :find_invited, only: %i[index]

  def index
    @events = policy_scope(Event)
  end

  def new
  end

  def create
  end

  def show
    @invite = Invite.new()
    @suggestion = Suggestion.new()
    @confirmed = @event.invites.where(accepted:true)
    #@messages = @event.messages
  end

  private

  def find_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def find_invited
    @invites = current_user.invites
    authorize @invites
  end

  def event_params
    params.require(:events).permit(:date, :title, :description)
  end
end
