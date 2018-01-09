class CustomMailer < ApplicationMailer
  default from: 'from@example.com'

  def custom_mail(user, mail_params)
    @user    = user
    @subject = mail_params[:subject]
    @body    = mail_params[:body]
    mail(to: @user.mail, subject: @subject, body: @body)
  end

end
