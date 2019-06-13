class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invitation.subject
  #
  def invitation
    @email = params[:email]
    @message = params[:message]
    @user = params[:user]

    mail to: @email
  end
end
