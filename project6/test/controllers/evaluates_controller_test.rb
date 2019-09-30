require 'test_helper'

class EvaluatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evaluate = evaluates(:one)
  end

  test "should get index" do
    get evaluates_url
    assert_response :redirect
  end

  test "should get new" do
    get new_evaluate_url
    assert_response :redirect
  end

  test "should create evaluate" do
    get "/evaluates/new"
    assert_response :redirect
  end

  test "should show evaluate" do
    get evaluate_url(@evaluate)
    assert_response :redirect
  end

  test "should get edit" do
    get edit_evaluate_url(@evaluate)
    assert_response :redirect
  end

  test "should update evaluate" do
    patch evaluate_url(@evaluate), params: { evaluate: { attempt: @evaluate.attempt, group_id: @evaluate.group_id, ratee_id: @evaluate.ratee_id, user_id: @evaluate.user_id } }
  end

  test "should destroy evaluate" do
    assert_difference('Evaluate.count', -1) do
      delete evaluate_url(@evaluate)
    end

    assert_redirected_to evaluates_url
  end
end
