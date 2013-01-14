require 'test_helper'

class EmailStatsControllerTest < ActionController::TestCase
  setup do
    @email_stat = email_stats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:email_stats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create email_stat" do
    assert_difference('EmailStat.count') do
      post :create, email_stat: @email_stat.attributes
    end

    assert_redirected_to email_stat_path(assigns(:email_stat))
  end

  test "should show email_stat" do
    get :show, id: @email_stat.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @email_stat.to_param
    assert_response :success
  end

  test "should update email_stat" do
    put :update, id: @email_stat.to_param, email_stat: @email_stat.attributes
    assert_redirected_to email_stat_path(assigns(:email_stat))
  end

  test "should destroy email_stat" do
    assert_difference('EmailStat.count', -1) do
      delete :destroy, id: @email_stat.to_param
    end

    assert_redirected_to email_stats_path
  end
end
