require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
     post users_path, params: { user: { name:  "",
                                      email: "user@invalid",
                                      password:              "foo",
                                      password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password111",
                                         password_confirmation: "password111" } }
    end
    follow_redirect!
    assert_template 'pages/index'
  end
end
