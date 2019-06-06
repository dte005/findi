class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]

  def index
    @events = policy_scope(Event)
    @event = Event.new
  end

  def new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else

    end
  end

  def show
    @invite = Invite.new()
    @suggestion = Suggestion.new()
    @message = Message.new()
    @confirmed = @event.invites.where(accepted: true)
    @invited = @event.invites.all
    @messages = Message.where(event_id: @event)
  end

  private

  def find_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:events).permit(:date, :title, :description)
  end
end
