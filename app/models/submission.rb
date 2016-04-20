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
    
    # Returns a list of the closest experts to my
    # submission.
    def experts

        raise "This object is not geocoded" unless self.geocoded?

        NUMBER_EXPERTS = 5

        experts = []

        User.all.each do |pigeon_expert| 
            distance = distance(self.longitude, 
                                self.latitude, 
                                pigeon_expert.longitude, 
                                pigeon_expert.latitude)    

            index_and_distance = largest_distance(experts)

            if experts.size < NUMBER_EXPERTS
                experts << pigeon_expert
            elsif experts.size == NUMBER_EXPERTS 
                    && distance < index_and_distance[1])
                experts.delete_at(index_and_distance[0])
                experts << pigeon_expert
            end
        end

        return experts
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

# Returns [index, distance], where index is the position
# of the expert in EXPERTS and distance is the distance 
# to that expert.
def largest_distance(experts)
    largest_dist = -1
    largest_index = -1

    index = 0
    experts.each do |expert|
        exp_dst = self.distance(expert.longitude, 
                                expert.latitude)  

        if exp_dst > largest_dst
            largest_index = index
            largest_dst = exp_dst
        end

        index += 1
    end

    return [largest_index, largest_dst]
end
