class NewAttendanceService

  def initialize(user, membership_type)
    @user = user
    @membership_type = membership_type
  end

  def perform
    validate_member_and_add_attendance
  end

  private

  attr_reader :membership_type
  attr_accessor :user


  def validate_member_and_add_attendance
    membership_notice = check_if_membership_valid

    (user.member_attendances.create and return UserSerializer.new(user).to_json) if membership_notice.blank?

    JSON.parse(UserSerializer.new(user).to_json).merge(membership_notice)
  end

  def check_if_membership_valid
    return extend_membership if user.status.include? 'paused'
    return notice_about_expired_membership if user.status.include? 'inactive'

    return notice_about_hour_restriction unless user_hour_restriction_valid?
    return notice_about_expired_attendences unless user_max_attendances_valid?
  end

  def user_check_in
    if user_hour_restriction_valid? and user_max_attendances_valid?
      user.membership_types.find(membership_id).max_week_attendance_restriction -= 1
    end
  end

  def extend_membership
    user.membership_ends_at += (Date.today - user.membership_pause_at)
    user.status = 'active'
    user.save
  end

  def user_hour_restriction_valid?
    membership_type.after_hour_restriction < Time.now ? true : false
  end

  def user_max_attendances_valid?
    get_user_attendance_count_this_month <= membership_type.max_week_attendance_restriction ? true : false
  end

  def get_user_attendance_count_this_month
    user.member_attendances.count {|a| a.created_at.month == DateTime.now.month}
  end


  def notice_about_expired_membership
    {notice: {detail: 'Članu je istekla članarina!'}}
  end

  def notice_about_hour_restriction
    {notice: {detail: 'Satna restrikcija nije zadovoljena'}}
  end

  def notice_about_expired_attendences
    {notice: {detail: 'Član nema više dolazaka!'}}
  end
end