class UserMembershipCheckJob < ApplicationJob
  queue_as :default

  def perform
    User.where(
        'membership_ends_at   < ? and status = ? ', Time.now, 'active'
    ).each do |user|
      user.update_column(:status, 'inactive')
      MembershipMailer.membership_expired_email(user).deliver_later(wait_until: 10.hour)
    end
  end
end
