class UserController < ApplicationController
  def index
    @courses = @user.get_my_courses
    @tests = @user.get_my_tests
  end

  def pass_course
    id = params[:id].to_i
    course = Course.find_by_id id
    if course
      user_course = UserCourse.get_user_course @user, course
      user_course.pass! if user_course
    end
    flash[:notice] = t('.course_completed')
    redirect_to user_index_path
  end

  def pass_test
    id = params[:id].to_i
    test = Test.find_by_id id
    if test
      user_test = UserTest.get_user_test @user, test
      user_test.pass! if user_test
    end
    flash[:notice] = t('.test_completed')
    redirect_to user_index_path    
  end
end