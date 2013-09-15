require 'test_helper'

class GroupIntegrationTests < ActionDispatch::IntegrationTest
  fixtures :groups

  setup do
    @origin = 'http://test.test.com'
  end
 
  test "sets cors headers for group list" do
    get '/groups', {}, {"Origin" => @origin}
    assert_equal 200, status
    assert_cors_headers_exist
  end

  test "sets cors headers for single group" do
    group = groups(:one)
    get "/groups/#{group.id}", {}, {"Origin" => @origin}
    assert_equal 200, status
    assert_cors_headers_exist
  end

  private

  def assert_cors_headers_exist
    assert_equal @origin, @response.headers['Access-Control-Allow-Origin']
    assert_equal 'true', @response.headers['Access-Control-Allow-Credentials']
    assert_equal 'GET', @response.headers['Access-Control-Allow-Methods']
    assert_equal '', @response.headers['Access-Control-Expose-Headers']
    assert_equal '1728000', @response.headers['Access-Control-Max-Age']
  end
 
end
