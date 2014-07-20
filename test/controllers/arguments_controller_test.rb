require 'test_helper'

describe ArgumentsController
  setup do
    @argument = arguments(:one)
    @valid = arguments(:valid)
    @defaults = @valid.attributes
    @valid.destroy
  end

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:arguments)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create argument" do
    assert_difference('Argument.count') do
      post :create, argument: @defaults
    end

    assert_redirected_to argument_path(assigns(:argument))
  end

  it "should show argument" do
    get :show, id: @argument
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @argument
    assert_response :success
  end

  it "should update argument" do
    patch :update, id: @argument, argument: @defaults
    assert_redirected_to argument_path(assigns(:argument))
  end

  it "should destroy argument" do
    assert_difference('Argument.count', -1) do
      delete :destroy, id: @argument
    end

    assert_redirected_to arguments_path
  end
end
