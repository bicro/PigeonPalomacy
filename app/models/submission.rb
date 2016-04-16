class Submission < ActiveRecord::Base
    has_many :submission_answers
    has_many :answers, through: :submission_answers
    
    geocoded_by :ip
    after_validation :safe_geocode
    
    # Pigeon needs help if the sum of answer.expert_score 
    # is greater or equal to this constant. 
    EXPERT_SCORE_THRESHOLD = Setting["Hurt Threshold"]
    
    def need_expert?
        return answers.sum(:expert_score) >= EXPERT_SCORE_THRESHOLD
    end
    
    def expert 
       #find nearest expert 
       # TODO fix me!
    end
    
    def info_text 
        # TODO fix me!
    end
    
    def add_answer aid
        SubmissionAnswer.create(submission_id: id, answer_id: aid) 
    end
    
    def safe_geocode
        begin
            geocode
        rescue
            Rails.logger.error "Geocoding doesn't work! Website must be down."
        end
    end
end
