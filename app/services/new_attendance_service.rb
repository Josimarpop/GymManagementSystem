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
    (user.member_attendances.create(membership_type_id: membership_type.id) and return UserSerializer.new(user).to_json) if membership_notice.blank?

    JSON.parse(UserSerializer.new(user).to_json).merge(membership_notice)
  end

  def check_if_membership_valid
    return extend_membership if user.status.include? 'paused'
    return notice_about_expired_membership if user.status.include? 'inactive'

    return notice_about_hour_restriction unless user_hour_restriction_valid?
    return notice_about_expired_attendances unless user_max_attendances_valid?
  end

  def extend_membership
    user.membership_ends_at += (Date.today - user.membership_pause_at)
    user.status = 'active'
    user.save
  end

  def user_hour_restriction_valid?
    membership_type.after_hour_restriction.to_formatted_s(:time) > Time.now.to_formatted_s(:time) ? true : false
  end

  def user_max_attendances_valid?
    get_user_attendance_count_this_month < membership_type.max_week_attendance_restriction ? true : false
  end

  def get_user_attendance_count_this_month
    user.member_attendances.where(id: membership_type.id).count{|m| m.created_at.between?(user.membership_starts_at, user.membership_ends_at)}
  end

  def notice_about_expired_membership
    {notice: {detail: 'Članu je istekla članarina!'}}
  end

  def notice_about_hour_restriction
    {notice: {detail: 'Satna restrikcija nije zadovoljena'}}
  end

  def notice_about_expired_attendances
    {notice: {detail: 'Član nema više dolazaka!'}}
  end
end