class Submission < ActiveRecord::Base
    has_many :submission_answers
    has_many :answers, through: :submission_answers
    
    geocoded_by :ip
    after_validation :safe_geocode
    
    # Pigeon needs help if the sum of answer.expert_score 
    # is greater or equal to this value. 
    def self.expert_score_threshold
        Setting["Hurt Threshold"]
    end    

    def need_expert?
        return answers.sum(:expert_score) >= Submission.expert_score_threshold
    end
    
    # Returns a list of the closest experts to my
    # submission. Assumes this object is geocoded.
    def experts
        begin
            number_experts = 3

            experts = []

            User.all.each do |pigeon_expert| 
                distance = distance_to([pigeon_expert.latitude, 
                                        pigeon_expert.longitude])    

                index_and_distance = largest_distance(experts)

                if experts.size < number_experts
                    experts << pigeon_expert
                elsif experts.size == number_experts && distance < index_and_distance[1]
                    experts.delete_at(index_and_distance[0])
                    experts << pigeon_expert
                end
            end
            return experts.sort_by{ |expert| self.distance_to([expert.latitude, expert.longitude])}
        rescue
            if User.all.count < 3
                return User.all
            else
                return User.take(3)
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
            exp_dst = self.distance_to([expert.latitude, 
                                        expert.longitude])  

            if exp_dst > largest_dist
                largest_index = index
                largest_dist = exp_dst
            end

            index += 1
        end

        return [largest_index, largest_dist]
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

