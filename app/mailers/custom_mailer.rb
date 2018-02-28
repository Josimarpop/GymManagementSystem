class CustomMailer < ApplicationMailer
  default from: 'Sportski centar Arena NO REPLY <scarena2016@gmail.com>'

  def custom_mail(user, mail_params)
    @user    = user
    @subject = mail_params[:subject]
    @body    = mail_params[:body]
    mail(to: @user.email, subject: @subject, template_path:'mailer', template_name: 'custom_mail')
  end

end
