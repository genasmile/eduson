class AdminController < ApplicationController
  def index
    @users = User.active.users.all
    @courses = Course.all
    @tests = Test.all
  end

  def courses_and_tests
    @courses = Course.get_added_courses
    @courses_users = {}
    @courses.each do |course|
      @courses_users[course.id] = course.get_course_users
    end

    @tests = Test.get_added_tests
    @tests_users = {}
    @tests.each do |test|
      @tests_users[test.id] = test.get_test_users
    end
  end

  def add_courses_and_tests
    users = params[:users]
    courses = params[:courses]
    tests = params[:tests]
    
    if !users
      return redirect_to admin_index_path
    end

    users.each do |user_id|
      if courses && !courses.empty?
        courses.each do |course_id|
          UserCourse.create(user_id: user_id, course_id: course_id) if !UserCourse.exists?(user_id: user_id, course_id: course_id)
        end
      end
      if tests && !tests.empty?
        tests.each do |test_id|
          UserTest.create(user_id: user_id, test_id: test_id) if !UserTest.exists?(user_id: user_id, test_id: test_id)
        end
      end
    end
    redirect_to courses_and_tests_admin_index_path
  end
end