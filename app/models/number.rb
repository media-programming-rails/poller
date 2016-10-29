require 'poll'

class Number < ApplicationRecord
  belongs_to :poll
#  validates_with PollTokenValidator
end
