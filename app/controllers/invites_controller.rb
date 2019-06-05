class InvitesController < ApplicationController
  before_action :invite_params
  before_action :find_event

  def create
    @invite = Invite.new(invite_params)
    @invite.event = @event
    if @invite.save
      redirect_to event_path(@event)
    else
      raise
      redirect_to events_path
    end
  end

  private

  def find_event
    @event = Event.find(params[:event_id])
    authorize @event
  end

  def invite_params
    params.require(:invite).permit(:message, :email)
  end
end
