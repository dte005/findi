class EventsController < ApplicationController
  before_action :find_event, only: %i[show]
  before_action :event_params, only: %i[create]

  def index
    @events = Event.all
  end

  def new
  end

  def create
  end

  def show
    @suggestion = Suggestion.new()
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:events).permit(:date, :title, :description)
  end
end
