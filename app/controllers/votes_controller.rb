class VotesController < ApplicationController
  before_action :find_suggestion, only: %i[create]
  before_action :find_vote, only: %i[destroy]

  def create
    raise
    @vote = Vote.new(votes_params)
    @event = @suggestion.event
    @vote.status = true
    @vote.suggestion = @suggestion
    @vote.user = current_user
    if @votes.save
      redirect_to event_path(@event)
    else
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = @vote.suggestion.event
    @vote.status = false
    @event = @suggestion.event
    redirect_to event_path(@event)
  end

  private

  def find_vote
    @vote = Vote.find(params[:id])
    authorize @vote
  end

  def find_suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
    authorize @suggestion
  end

  def votes_params
    params.require(:vote).permit(:status)
  end
end
