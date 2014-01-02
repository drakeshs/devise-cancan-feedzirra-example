require 'test_helper'

class RssTestsControllerTest < ActionController::TestCase
  setup do
    @rss_test = rss_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rss_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rss_test" do
    assert_difference('RssTest.count') do
      post :create, rss_test: { author: @rss_test.author, status: @rss_test.status, title: @rss_test.title, url: @rss_test.url }
    end

    assert_redirected_to rss_test_path(assigns(:rss_test))
  end

  test "should show rss_test" do
    get :show, id: @rss_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rss_test
    assert_response :success
  end

  test "should update rss_test" do
    put :update, id: @rss_test, rss_test: { author: @rss_test.author, status: @rss_test.status, title: @rss_test.title, url: @rss_test.url }
    assert_redirected_to rss_test_path(assigns(:rss_test))
  end

  test "should destroy rss_test" do
    assert_difference('RssTest.count', -1) do
      delete :destroy, id: @rss_test
    end

    assert_redirected_to rss_tests_path
  end
end
