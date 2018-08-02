require 'test_helper'

class DelayedJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should show job" do
    get delayed_job_path
    assert_response :success
  end

end
