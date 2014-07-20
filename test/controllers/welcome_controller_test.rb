require 'test_helper'

describe WelcomeController
  it "should get index" do
    get :index
    assert_response :success
  end
end
