require 'spec_helper'

describe SubmissionAnswer do
    before do
        @answer = Answer.create(content: "blah") 
        @submission = Submission.create()
    end
    
    it "should link question and submission correctly" do
        @submission_answer = SubmissionAnswer.create(submission_id: @submission.id, answer_id: @answer.id)
       
        @submission_answer.answer.should == @answer
        @submission_answer.submission.should == @submission
    end
end