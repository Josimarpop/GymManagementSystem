class NewBonusAttendanceService

  def initialize(user)
    @user = user
  end

  attr_accessor :user

  def perform
    return add_bonus_attendance if user.bonus_attendance.blank?
    no_allowed_bonus_attendace_notice
  end

  def add_bonus_attendance
    user.update(bonus_attendance: Time.now)
    added_bonus_attendance_notice
  end

  def added_bonus_attendance_notice
    {notice: {detail: 'Članu je uspješno dodan bonus dolazak.'}, date: user.bonus_attendance}
  end

  def no_allowed_bonus_attendace_notice
    {notice: {detail: 'Članu nije moguće dodati bonus dolazak.'}, date: user.bonus_attendance}
  end
end