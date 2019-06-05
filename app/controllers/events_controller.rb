class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]

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
  end

  private

  def find_event
    authorize @event = Event.find(params[:id])
  end

  def event_params
    params.require(:events).permit(:date, :title, :description)
  end
end
