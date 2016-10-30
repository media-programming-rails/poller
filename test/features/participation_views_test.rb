
require 'test_helper'

class ParticipationViewsTest < ActionDispatch::IntegrationTest
  test "view after participation" do
    number = numbers(:one)
    poll = number.poll
    visit number_path(number)
    assert !page.has_content?("Hash"), "Participation Key Should not be included"
    assert page.has_content?(poll.name), "Poll name should be shown"
    click_on poll.name
    assert page.has_content?(poll.name), "Poll name should be shown"
  end
end
