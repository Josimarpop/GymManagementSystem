class NewAttendanceService

  def initialize(user, membership_id)
    @user = user
    @membership_id = membership_id
  end

  def perform
    membership_validation
  end

  private

  attr_reader :membership_id
  attr_accessor :user

  def membership_validation
    membership = check_if_membership_valid
    user_json = UserSerializer.new(user)

    return user_json.merge(membership) if membership.present?
    user_json
  end

  def check_if_membership_valid
    return extend_membership if user.status.include? 'paused'
    return notice_about_expired_membership if user.status.include? 'inactive'

    return notice_about_hour_restriction unless user_hour_restriction_valid?
    return notice_about_expired_attendences unless user_max_attendances_valid?
    nil
  end

  def user_check_in
    if user_hour_restriction_valid? and user_max_attendances_valid?
      user.membership_types(membership_id).max_week_attendance_restriction -= 1;
    end
  end

  def extend_membership
    user.membership_ends_at += (Date.today - user.membership_pause_at)
    user.status = 'active'
    user.save
  end

  def user_hour_restriction_valid?
    user.membership_types(membership_id).after_hour_restriction < Time.now ? true : false
  end

  def user_max_attendances_valid?
    user.membership_types(membership_id).max_week_attendance_restriction > 0 ? true : false
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