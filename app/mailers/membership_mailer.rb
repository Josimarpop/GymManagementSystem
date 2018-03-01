class MembershipMailer < ApplicationMailer
  default from: 'Sportski centar Arena NO REPLY no-reply@sportskicentararena.com'
  default template_path: 'mailer'

  def membership_renewal_email(user)
    @user = user
    mail(to: @user.email, subject: 'Produžili ste članarinu!', template_name: 'membership_renewal')
  end

  def membership_expired_email(user)
    @user = user
    mail(to: @user.email, subject: 'Isteknuta članarina!', template_name: 'membership_expired')
  end

  def membership_expired_in_3days_email(user)
    @user = user
    mail(to: @user.email, subject: '3 dana do isteka članarine!', template_name: 'membership_expired_in_3days')
  end
end
