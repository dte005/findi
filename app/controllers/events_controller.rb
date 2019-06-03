class EventsController < ApplicationController
  before_action :find_event, only: %i[show]

  def index
    @events = Event.all
  end

  def show
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

end
