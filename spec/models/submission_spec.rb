require 'spec_helper'

describe Submission do 
    before do 
        @submission = Submission.create
        @answer = Answer.create({content: "Yes", expert_score: 1.0})
        @submission.add_answer @answer.id
    end
    
   it 'should say an expert is needed' do
        @submission.need_expert?.should be true
   end
    
    it 'should find the closest expert' do
        # TODO!
    end
    
    it 'should add an answer to this submission' do
        answer2 = Answer.create({content: "Yes", expert_score: 1.0})
        @submission.add_answer answer2.id
        @submission.answers.include? Answer.find(answer2.id)
    end
end