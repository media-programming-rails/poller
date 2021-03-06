require 'test_helper'

class PollsControllerTest < ActionDispatch::IntegrationTest

  setup do
    login_as(users(:one))
    @poll = polls(:one)
    @valid_poll_params =
      { answer_type: @poll.answer_type,
        description: @poll.description,
        instant_result: @poll.instant_result,
        name: @poll.name,
        open: @poll.open,
        public_result: @poll.public_result,
        participants: @poll.participants }
  end

  test "should get index" do
    get polls_url
    assert_response :success
  end

  test "should get new" do
    get new_poll_url
    assert_response :success
  end

  test "should create poll" do
    assert_difference('Poll.count') do
      post polls_url, params: { poll: @valid_poll_params}
    end

    assert_redirected_to poll_url(Poll.last)
  end

  test "should show poll" do
    get poll_url(@poll)
    assert_response :success
  end

  test "should get edit" do
    get edit_poll_url(@poll)
    assert_response :success
  end

  test "should update poll" do
    patch poll_url(@poll), params: { poll: { answer_type: @poll.answer_type, description: @poll.description, instant_result: @poll.instant_result, name: @poll.name, open: @poll.open, public_result: @poll.public_result } }
    assert_redirected_to poll_url(@poll)
  end

  test "should destroy poll" do
    assert_difference('Poll.count', -1) do
      delete poll_url(@poll)
    end

    assert_redirected_to polls_url
  end
end
