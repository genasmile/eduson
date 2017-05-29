class User < ActiveRecord::Base
  ADMIN = 1
  USER = 100

  has_many :user_tests
  has_many :user_courses

  scope :active, -> { where(active: true) }
  scope :users, -> { where(permission: USER) }
  scope :by_login, ->(login) { where(login: login) }
  scope :by_pass, ->(pass) { where(pass: pass) }

  def admin?
    self.permission == ADMIN
  end

  def user?
    self.permission == USER
  end

  def self.authenticate login, pass
    User.active.by_login(login).by_pass(pass).first
  end

  def get_my_courses
    Course.get_user_courses self
  end

  def get_my_tests
    Test.get_user_tests self
  end
end