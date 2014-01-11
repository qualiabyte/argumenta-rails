require 'test_helper'

class PropositionsControllerTest < ActionController::TestCase
  setup do
    @proposition = propositions(:one)
    @update = {
      text: "My proposition!",
      sha1: "fe1d2c8da97cd63ff28f9a1a3598fe29def216dd"
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:propositions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create proposition" do
    @proposition.destroy
    assert_difference('Proposition.count') do
      post :create, proposition: @proposition.attributes
    end

    assert_redirected_to proposition_path(assigns(:proposition))
  end

  test "should show proposition" do
    get :show, id: @proposition
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposition
    assert_response :success
  end

  test "should update proposition" do
    patch :update, id: @proposition, proposition: @update
    assert_redirected_to proposition_path(assigns(:proposition))
  end

  test "should destroy proposition" do
    assert_difference('Proposition.count', -1) do
      delete :destroy, id: @proposition
    end

    assert_redirected_to propositions_path
  end
end
