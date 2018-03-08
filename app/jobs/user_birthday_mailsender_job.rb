class UserBirthdayMailsenderJob < ApplicationJob
  queue_as :default

  def perform
    User.where(
        'birth_date = ?', Date.today
    ).each do |user|
      UserBirthdayMailer.birthday_notice_email(user).deliver_later
    end
  end
end
