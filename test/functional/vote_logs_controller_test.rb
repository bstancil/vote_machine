require 'test_helper'

class VoteLogsControllerTest < ActionController::TestCase
  setup do
    @vote_log = vote_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vote_log" do
    assert_difference('VoteLog.count') do
      post :create, vote_log: { hack_id: @vote_log.hack_id, hack_score: @vote_log.hack_score, logged_at: @vote_log.logged_at, time_index: @vote_log.time_index }
    end

    assert_redirected_to vote_log_path(assigns(:vote_log))
  end

  test "should show vote_log" do
    get :show, id: @vote_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vote_log
    assert_response :success
  end

  test "should update vote_log" do
    put :update, id: @vote_log, vote_log: { hack_id: @vote_log.hack_id, hack_score: @vote_log.hack_score, logged_at: @vote_log.logged_at, time_index: @vote_log.time_index }
    assert_redirected_to vote_log_path(assigns(:vote_log))
  end

  test "should destroy vote_log" do
    assert_difference('VoteLog.count', -1) do
      delete :destroy, id: @vote_log
    end

    assert_redirected_to vote_logs_path
  end
end
