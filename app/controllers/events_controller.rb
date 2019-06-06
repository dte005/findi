class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]

  def index
    @events = policy_scope(Event)
    @event = Event.new

    respond_to do |format|
      format.html { }
      format.js do
        beginning = Time.parse(params[:date]).beginning_of_day
        ending = Time.parse(params[:date]).end_of_day
        @day_events = @events.where("date BETWEEN '#{beginning}' AND '#{ending}'")
      end
    end
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
    @suggestion_selected = @event.suggestions.find_by(selected: true)
    @confirmed = @event.invites.where(accepted: true)
    @invited = @event.invites.all
    @messages = Message.where(event_id: @event)
  end

  def get_events_on_day
    @day_events = Event.where(date: params[:date])
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
