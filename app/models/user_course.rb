class UserCourse < ActiveRecord::Base
  scope :passed, -> { where(passed: true) }
  scope :active, -> { where(passed: false) }
  scope :by_user, ->(user) { where(user_id: user.id) if user}
  scope :by_course, ->(course) { where(course_id: course.id) if course }

  def self.get_user_course user, course
    self.by_user(user).by_course(course).first
  end

  def pass!
    self.passed = true
    self.save!
  end

  def passed?
    self.passed
  end
end