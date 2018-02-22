class MembershipMailer < ApplicationMailer
  default from: 'from@example.com'


  def membership_renewal_email(user)
    @user = user
    mail(to: @user.mail, subject: 'Produžili ste članarinu!')
  end

  def membership_expired_email(user)
    @user = user
    mail(to: @user.mail, subject: 'Istekla Vam je članarina!')
  end

  def membership_expired_in_3days_email(user)
    @user = user
    mail(to: @user.mail, subject: 'Istiće vam članarina za 3 dana!')
  end
end
