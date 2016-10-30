class PollValidator < ActiveModel::Validator
  def validate(record)
    poll = record.poll
    unless record.poll.valid_participation_token?(record.participation_key)
      record.errors[:poll] << 'Invalid participation token for this poll'
    else
      unless poll.register_answer(record)
        record.errors[:poll] << 'Answer could not be registered with this poll'
      end
    end
  end
end
