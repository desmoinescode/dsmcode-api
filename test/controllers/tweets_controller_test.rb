require 'test_helper'

class TweetsControllerTest < ActionController::TestCase

  test "should show all tweets for given ids" do
    get :show, :ids => [tweets(:one).id, tweets(:two).id]
    assert_response :success
    assert_equal JSON.parse(@response.body), [
      {
        'id' => groups(:two).id,
        'content' =>  'Two',
      },
      {
        'id' => groups(:one).id,
        'content' =>  'One',
      },
    ]
  end

end
