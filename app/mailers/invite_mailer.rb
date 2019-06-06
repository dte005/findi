class InviteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invite_mailer.invitation.subject
  #
  def invitation
    @email = params[:email]
    @message = params[:message]

    mail to: @email
  end
end
