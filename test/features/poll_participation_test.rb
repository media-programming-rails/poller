require 'test_helper'
include PollsHelper

def t(text)
  I18n.t(text)
end
class PollParticipationTest < ActionDispatch::IntegrationTest

  def setup
    @poll = polls(:hours)

    # this is a questionable workaround:
    # fixtures just load in the db and don't call ar callbacks.
    # probably should use factory girl to create the test data.
    @poll.generate_participation_tokens
    assert_equal 10, @poll.participation_tokens.size
  end

  test "poll participation" do
    participation_path = participation_urls(@poll).first

    visit participation_path
    fill_in :number_hours, with: 5
    click_on t('numbers.form.submit')
    assert page.has_content?(t('.thank_you')), "Response should have been saved & acknowledged"
  end

  test "second poll participation should not possible" do

    participation_path = participation_urls(@poll).first

    visit participation_path
    fill_in :number_hours, with: 5
    click_on t('numbers.form.submit')
    assert page.has_content?(t('.thank_you')), "Response should have been saved & acknowledged"

    get participation_path
    assert_redirected_to poll_path(@poll)

    visit participation_path
    assert page.has_content?(@poll.name), "should be redirected to poll page"
    assert page.has_content?(t('.invalid_participation_url')), "should warn about invalid url/hash"
end

  test "used participation url should not be shown on poll page" do

    participation_path = participation_urls(@poll).first

    visit participation_path
    fill_in :number_hours, with: 5
    click_on t('numbers.form.submit')
    assert page.has_content?(t('.thank_you')), "Response should have been saved & acknowledged"

    visit poll_path(@poll)
    assert !page.has_content?(participation_path), "used participation path needs to be removed from poll"

  end

  test "url with valid key should show participation form" do
    participation_path = participation_urls(@poll).first
    visit participation_path
    assert page.has_content?(@poll.name), "poll name not shown"
  end

  test "url with invalid key should not show participation form" do
    participation_path =   participitation_url(@poll,"not_a_proper_key")
    visit participation_path
    assert page.has_content?(@poll.name), "redirects to poll page"
    assert page.has_content?(t('invalid_participation_url')), "should contain proper warning"
  end

  test "it should also not be possible to just post the parameters without the proper key" do
    assert_no_difference('Number.count') do
      post numbers_url, params: { number: { participation_key: "invalid_key", hours: 4, poll_id: @poll.id } }
    end
    assert_redirected_to poll_path(@poll)
  end



end
