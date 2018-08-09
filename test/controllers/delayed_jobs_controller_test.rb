require 'test_helper'

class DelayedJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get delayed_jobs_path
    assert_response :success
  end

  test "should show job" do
    get delayed_job_path(1)
    assert_response :success
  end

  test "should destroy job" do
    assert_difference('Delayed::Job.all.count', -1) do
      delete delayed_job_path(1)
    end

    assert_redirected_to delayed_jobs_path
  end

end
