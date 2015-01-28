class Answer < ActiveRecord::Base
  belongs_to :reply
  belongs_to :question
  belongs_to :possible_answer
end
