require 'test_helper'

class GroupsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index, :format => :json
    assert_response :success
    json_groups = JSON.parse(@response.body)
    assert_equal [
      {
        'id' => groups(:two).id,
        'name' => 'GroupTwo',
        'website' => 'www.two.com',
        'twitter_handle' => 'two_twit',
        'google_group' => 'two_grp',
        'facebook' => 'two_fb',
        'tweets' => [tweets(:three).id, tweets(:four).id],
        'posts' => [posts(:three).id, posts(:four).id]
      },
      {
        'id' => groups(:one).id,
        'name' => 'GroupOne',
        'website' => 'www.one.com',
        'twitter_handle' => 'one_twit',
        'google_group' => 'one_grp',
        'facebook' => 'one_fb',
        'tweets' => [tweets(:two).id, tweets(:one).id],
        'posts' => [posts(:two).id, posts(:one).id]
      },
    ], json_groups
  end

  test "should show group" do
    get :show, id: groups(:one)
    assert_response :success
    json_group = JSON.parse(@response.body)
    assert_equal json_group, {
      'id' => groups(:one).id,
      'name' => 'GroupOne',
      'website' => 'www.one.com',
      'twitter_handle' => 'one_twit',
      'google_group' => 'one_grp',
      'facebook' => 'one_fb',
      'tweets' => [tweets(:two).id, tweets(:one).id],
      'posts' => [posts(:two).id, posts(:one).id]
    }
  end

end
