class MembershipMailer < ApplicationMailer
  default from: 'Sportski centar Arena NO REPLY <scarena2016@gmail.com>'
  default template_path: 'custom_mail'

  def membership_renewal_email(user)
    @user = user
    mail(to: @user.mail, subject: 'Produžili ste članarinu!', template_name: 'mailer/membership_renewal')
  end

  def membership_expired_email(user)
    @user = user
    mail(to: @user.mail, subject: 'Isteknuta članarina!', template_name: 'mailer/membership_expired')
  end

  def membership_expired_in_3days_email(user)
    @user = user
    mail(to: @user.mail, subject: '3 dana do isteka članarine!', template_name: 'mailer/membership_expired_in_3days')
  end
end
