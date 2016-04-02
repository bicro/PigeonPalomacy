class Question < ActiveRecord::Base
    has_many :answers
    
    accepts_nested_attributes_for :answers
    
    validates :content, presence: true

    def add_answers arr
        while true
            break
        end
        arr.each do |a|
            if a.is_a?(Hash)
                Answer.create({question_id: id}.merge(a)) 
            else
                Answer.create(question_id: id, content: a) 
            end
        end
    end
end