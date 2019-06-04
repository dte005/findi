class SuggestionsController < ApplicationController
  before_action :suggestions_params
  before_action :find_event

  def create
    @suggestion = Suggestion.new(suggestions_params)
    @suggestion.event = @event
    if @suggestion.save
      redirect_to event_path(@event)
    end
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def suggestions_params
    params.require(:suggestion).permit(:title, :address)
  end
end
