class NewBonusAttendanceService

  def initialize(user)
    @user = user
  end

  def perform
    (add_bonus_attendance and return added_bonus_attendance_notice) if user.bonus_attendance.blank?
    no_allowed_bonus_attendace_notice
  end

  private

  attr_accessor :user

  def add_bonus_attendance
    user.bonus_attendance =  Time.now
    user.save
  end

  def added_bonus_attendance_notice
    {notice: {detail: 'Članu je uspješno dodan bonus dolazak.'}, date: user.bonus_attendance}
  end

  def no_allowed_bonus_attendace_notice
    {notice: {detail: 'Članu nije moguće dodati bonus dolazak.'}, date: user.bonus_attendance}
  end
end