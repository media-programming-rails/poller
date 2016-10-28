class Answer < ApplicationRecord
  self.abstract_class = true
  belongs_to :poll
end
