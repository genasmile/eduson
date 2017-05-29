class Test < ActiveRecord::Base

  def self.get_added_tests
    self.joins("RIGHT JOIN user_tests ut ON tests.id = ut.test_id WHERE ut.passed = #{false}").group('tests.id')
  end

  def get_test_users
    User.select('users.fio').joins(:user_tests).where('user_tests.test_id = ? AND user_tests.passed = ?', self.id, false)
  end

  def self.get_user_tests user
    Test.joins('JOIN user_tests ut ON tests.id = ut.test_id').where('ut.user_id = ?', user.id).all
  end

  def passed_by_user? user
    user_test = UserTest.get_user_test user, self
    user_test && user_test.passed
  end
end