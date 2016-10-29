module PollsHelper
  def participation_urls(poll)
    poll.participation_tokens.map do | participant |
       participitation_url(@poll,participant.participation_key)
    end
  end
end
