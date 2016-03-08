require 'spec_helper'

describe Question do
    before do
        @question = Question.create({content: "Am I ready?"}) 
    end
    
    it "should have content filled in" do
       @question.content.should eq("Am I ready?")
    end
    
    it "should have no answers when new" do
       @question.answers.size.should == 0 
    end
    
    describe "#add_answers" do
        it "should have answers when adding text" do
            @question.add_answers(["Hi"])
            @question.answers.size.should == 1
            @question.answers.first.content.should == "Hi"
        end
        
        it "should have answers when adding hash" do
            @question.add_answers([{content: "Hi", img_url: "google.com"}])
            @question.answers.size.should == 1
            @question.answers.first.content.should == "Hi"
            @question.answers.first.img_url.should == "google.com"
        end    
    end
end