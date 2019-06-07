class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]

  def index
    @events = policy_scope(Event)
    @pending_invites = Invite.where(email: current_user.email).where(accepted: nil)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    time = params[:event_time].values.last(2)
    date = params[:event_date].values.first
    @event.date = DateTime.parse("#{date}T#{time[0]}:#{time[1]}")
    @event.user = current_user

    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      render :index
    end
  end

  def show
    @invite = Invite.new()
    @suggestion = Suggestion.new()
    @message = Message.new()
    @suggestion_selected = @event.suggestions.find_by(selected: true)
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
    params.require(:event).permit(:title, :description, :photo)
  end
end
