class UserTest < ActiveRecord::Base
  scope :passed, -> { where(passed: true) }
  scope :active, -> { where(passed: false) }
  scope :by_user, ->(user) { where(user_id: user.id) if user}
  scope :by_test, ->(test) { where(test_id: test.id) if test }

  def self.get_user_test user, test
    self.by_user(user).by_test(test).first
  end

  def pass!
    self.passed = true
    self.save!
  end

  def passed?
    self.passed
  end
end