class Answer < ActiveRecord::Base
  belongs_to :question
  validates :content, presence: true
  mount_uploader :answer_image, AnswerImageUploader
end
