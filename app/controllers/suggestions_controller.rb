class SuggestionsController < ApplicationController
  before_action :find_event, only: [:create]
  before_action :find_suggestion, only: [:destroy, :update]

  def create
    @suggestion = Suggestion.new(suggestions_params)
    @suggestion.event = @event
    if @suggestion.save
      redirect_to event_path(@event)
    else
      flash[:alert] = @suggestion.errors.values.flatten.first
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = @suggestion.event_id
    @suggestion.destroy
    redirect_to event_path(@event)
  end

  def update
    @event = @suggestion.event
    @event.suggestions.each do |suggest|
      unless suggest.id == @suggestion.id
        suggest.selected = false
        suggest.save
      end
    end
    @suggestion.selected = true
    @suggestion.save
    redirect_to event_path(@event)
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def find_suggestion
    @suggestion = Suggestion.find(params[:id])
    authorize @suggestion
  end

  def suggestions_params
    params.require(:suggestion).permit(:title, :address)
  end
end
