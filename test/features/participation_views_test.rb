
require 'test_helper'

class ParticipationViewsTest < ActionDispatch::IntegrationTest
  def setup
    @poll = polls(:one)
  end
  test "view after participation" do
    participation_path = participation_urls(@poll).first

    # participate
    visit participation_path
    fill_in :number_hours, with: 5
    click_on t('numbers.form.submit')

    # second visit to url
    visit participation_path

    assert page.has_content?(@poll.name), "Poll name should be shown"
  end
end
