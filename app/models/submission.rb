class Submission < ActiveRecord::Base
    has_many :submission_answers
    has_many :answers, through: :submission_answers
end
