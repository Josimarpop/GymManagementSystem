class UserBirthdayMailer < ApplicationMailer
  default from: 'Sportski centar Arena NO REPLY <no_reply@sportskicentararena.com>'
  default template_path: 'mailer'

  def birthday_notice_email(user)
    @user = user
    mail(to: @user.email, subject: 'Sretan rođendan!', template_name: 'birthday_notice')
  end
end
