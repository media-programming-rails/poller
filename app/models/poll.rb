class Poll < ApplicationRecord
  has_many :answers
  has_many :participation_tokens
end
