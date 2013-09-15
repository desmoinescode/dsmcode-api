require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index, :format => :json
    assert_response :success
    json_groups = JSON.parse(@response.body)
    assert_equal [
      JSON.parse(groups(:two).to_json),
      JSON.parse(groups(:one).to_json),
    ], json_groups
  end

  test "should show group" do
    get :show, id: groups(:one)
    assert_response :success
    json_group = JSON.parse(@response.body)
    assert_equal JSON.parse(groups(:one).to_json), json_group
  end

end
