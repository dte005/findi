class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]
  # before_action :find_invited, only: %i[index]

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
    @confirmed = @event.invites.where(accepted: true)
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
