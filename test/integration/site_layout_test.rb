require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
 test "layout links" do
    get root_path
    assert_template 'pages/index'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", kinds_index_path
    assert_select "a[href=?]", favorites_index_path
    assert_select "a[href=?]", users_edit_path
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_new_path
    assert_select "a[href=?]", login_path
  end
end
