require 'test_helper'

class UmvoxqsControllerTest < ActionController::TestCase
  setup do
    @umvoxq = umvoxqs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:umvoxqs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create umvoxq" do
    assert_difference('Umvoxq.count') do
      post :create, umvoxq: @umvoxq.attributes
    end

    assert_redirected_to umvoxq_path(assigns(:umvoxq))
  end

  test "should show umvoxq" do
    get :show, id: @umvoxq.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @umvoxq.to_param
    assert_response :success
  end

  test "should update umvoxq" do
    put :update, id: @umvoxq.to_param, umvoxq: @umvoxq.attributes
    assert_redirected_to umvoxq_path(assigns(:umvoxq))
  end

  test "should destroy umvoxq" do
    assert_difference('Umvoxq.count', -1) do
      delete :destroy, id: @umvoxq.to_param
    end

    assert_redirected_to umvoxqs_path
  end
end
