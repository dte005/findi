class VotesController < ApplicationController
  before_action :find_suggestion, only: %i[create]

  def create
    @vote = Vote.new
    authorize @vote
    @event = @suggestion.event
    if params[:vote] == 'up'
      @vote.status = true
    else
      @vote.status = false
    end
    @vote.suggestion = @suggestion
    @vote.user = current_user
    if @vote.save
      redirect_to event_path(@event)
    else
      flash[:alert] = @vote.errors.values.flatten.first
      redirect_to event_path(@event)
    end
  end

  private

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
  end

end
