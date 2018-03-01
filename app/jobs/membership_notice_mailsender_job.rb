class MembershipNoticeMailsenderJob < ApplicationJob
  queue_as :default

  def perform
    User.where(
        'membership_ends_at   < ? and status = ? ', Time.now + 3, 'active'
    ).each do |user|
      MembershipMailer.membership_expired_in_3days_email(user).deliver_now
    end
  end

end
