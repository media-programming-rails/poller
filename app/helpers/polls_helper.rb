module PollsHelper
  def participation_urls(poll)
    poll.participation_tokens.map do | participant |
       participitation_url(poll,participant.participation_key)
    end
  end
#  def participation_paths(poll)
#    poll.participation_tokens.map do | participant |
#       participitation_path(poll,participant.participation_key)
#    end
#  end
end
