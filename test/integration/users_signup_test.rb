require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  get users_new_path
  assert_no_difference 'User.count' do
  post users_new_path, params: { user: { name:  "",
                                     email: "user@invalid",
                                     password:              "foo",
                                     password_confirmation: "bar" } }
  end
  assert_template 'users/new'
end
