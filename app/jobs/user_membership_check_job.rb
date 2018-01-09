class UserMembershipCheckJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.where(
        'membership_ends_at   < ? ', Time.now
    ).each do |user|
      user.status = 'Inactive'
      MembershipMailer.membership_expired_email(user).deliver_now
    end
  end
end
