require 'test_helper'

class ParticipationTokensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participation_token = participation_tokens(:one)
  end

  test "should get index" do
    get participation_tokens_url
    assert_response :success
  end

  test "should get new" do
    get new_participation_token_url
    assert_response :success
  end

  test "should create participation_token" do
    assert_difference('ParticipationToken.count') do
      post participation_tokens_url, params: { participation_token: { participation_key: @participation_token.participation_key, poll_id: @participation_token.poll_id } }
    end

    assert_redirected_to participation_token_url(ParticipationToken.last)
  end

  test "should show participation_token" do
    get participation_token_url(@participation_token)
    assert_response :success
  end

  test "should get edit" do
    get edit_participation_token_url(@participation_token)
    assert_response :success
  end

  test "should update participation_token" do
    patch participation_token_url(@participation_token), params: { participation_token: { participation_key: @participation_token.participation_key, poll_id: @participation_token.poll_id } }
    assert_redirected_to participation_token_url(@participation_token)
  end

  test "should destroy participation_token" do
    assert_difference('ParticipationToken.count', -1) do
      delete participation_token_url(@participation_token)
    end

    assert_redirected_to participation_tokens_url
  end
end
