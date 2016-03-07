class QuestionsController < ApplicationController
  def index
    @questions = Question.all
    
    Rails.logger.info @questions.size
  end
  
  def new
    
  end
  
  def create
  end
end
