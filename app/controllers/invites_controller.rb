class InvitesController < ApplicationController
  before_action :invite_params, only: %i[create]
  before_action :find_event, except: %i[update destroy]

  def create
    @invite = Invite.new(invite_params)
    @invite.event = @event
    if @invite.save
      mail = InviteMailer.with(email: @invite.email, message: @invite.message).invitation
      mail.deliver_now
      redirect_to event_path(@event)
    else
      flash[:alert] = @invite.errors.values.flatten.first
      redirect_to event_path(@event)
    end
  end

  def update
    @invite = Invite.find(params[:id])
    @invite.user = current_user
    @invite.accepted = true
    @invite.save

    authorize @invite
    if @invite.save
      redirect_to event_path(@invite.event)
    else
      redirect_to events_path
    end
  end


  def destroy
    @invite = Invite.find(params[:id])
    authorize @invite
    if @invite.destroy
      redirect_to events_path
    else
      raise
      flash[:alert] = @invite.errors.values.flatten.first
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
