require 'test_helper'

class PostsControllerTest < ActionController::TestCase

  test "should show all posts for given ids" do
    get :show, :ids => [posts(:one).id, posts(:two).id]
    assert_response :success
    assert_equal JSON.parse(@response.body), [
      {
        'id' => posts(:two).id,
        'title' =>  'Title Two',
      },
      {
        'id' => posts(:one).id,
        'title' =>  'Title One',
      },
    ]
  end

end
