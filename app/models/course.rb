class Course < ActiveRecord::Base
  def self.get_added_courses
    self.joins("RIGHT JOIN user_courses uc ON courses.id = uc.course_id WHERE uc.passed = #{false}").group('courses.id')
  end

  def get_course_users
    User.select('users.fio').joins(:user_courses).where('user_courses.course_id = ? AND user_courses.passed = ?', self.id, false)
  end

  def self.get_user_courses user
    Course.joins('JOIN user_courses uc ON courses.id = uc.course_id').where('uc.user_id = ?', user.id).all
  end

  def passed_by_user? user
    user_course = UserCourse.get_user_course user, self
    user_course && user_course.passed?
  end
end