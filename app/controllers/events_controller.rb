class EventsController < ApplicationController
  before_action :find_event, only: %i[show destroy]
  before_action :event_params, only: %i[create]

  def index
    @events = policy_scope(Event)
    @pending_invites = Invite.where(email: current_user.email).where(accepted: nil)
    @event = Event.new
    unless @pending_invites.empty?
      flash[:alert] = "You have #{@pending_invites.count} invite#{"s" if @pending_invites.count > 1} pending. Click on the envelope icon"
    end
  end

  def create
    @event = Event.new(event_params)
    time = params[:event_time].values.last(2)
    date = params[:event_date].values.first
    @event.user = current_user

    if params[:event_date].values.first.empty?
      @event.date = ""
    else
      @event.date = DateTime.parse("#{date}T#{time[0]}:#{time[1]}")
    end

    authorize @event
    if @event.save
      redirect_to event_path(@event)
    else
      flash[:alert] = @event.errors.values.flatten.first
      @events = policy_scope(Event)
      @pending_invites = Invite.where(email: current_user.email).where(accepted: nil)

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
    @messages = Message.where(event_id: @event).order(:created_at)

    @suggest_map = @event.suggestions.where.not(latitude: nil, longitude: nil).where(selected: true)
    @markers = @suggest_map.map do |flatten|
      {
        lat: flatten.latitude,
        lng: flatten.longitude
      }
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
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
