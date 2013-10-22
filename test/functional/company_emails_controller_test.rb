require 'test_helper'

class CompanyEmailsControllerTest < ActionController::TestCase
  setup do
    @company_email = company_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:company_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company_email" do
    assert_difference('CompanyEmail.count') do
      post :create, company_email: @company_email.attributes
    end

    assert_redirected_to company_email_path(assigns(:company_email))
  end

  test "should show company_email" do
    get :show, id: @company_email.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company_email.to_param
    assert_response :success
  end

  test "should update company_email" do
    put :update, id: @company_email.to_param, company_email: @company_email.attributes
    assert_redirected_to company_email_path(assigns(:company_email))
  end

  test "should destroy company_email" do
    assert_difference('CompanyEmail.count', -1) do
      delete :destroy, id: @company_email.to_param
    end

    assert_redirected_to company_emails_path
  end
end
