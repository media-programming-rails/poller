class Number < ApplicationRecord
  belongs_to :poll
  validates_with PollValidator
end
