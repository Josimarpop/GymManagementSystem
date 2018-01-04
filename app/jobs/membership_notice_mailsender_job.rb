class MembershipNoticeMailsenderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    User.where(
        'membership_ends_at   < ? ', Time.now + 3
    ).each do |user|
      MembershipMailer.create_membership_expired_in_3days_email(user)
    end
  end

end