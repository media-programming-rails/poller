require 'test_helper'

def t(text)
  I18n.t(text)
end

class OneClickLogTest < ActionDispatch::IntegrationTest
  def setup
    login_for_capybara(users(:one))
  end
  test "poll creation generates participation hashes" do
    visit new_poll_path
    fill_in :poll_name, with: "Poll from Feature Test"
    fill_in :poll_description, with: "bla bla"
    fill_in :poll_participants, with: 10
    click_on t('polls.form.submit')
    assert page.has_content? 'Poll was successfully created.'

    participation_tokens = Poll.last.participation_tokens
    assert_equal 10, participation_tokens.size
  end


end
