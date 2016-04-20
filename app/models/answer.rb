class Answer < ActiveRecord::Base
  belongs_to :question
  validates :content, presence: true
  mount_uploader :answer_image, AnswerImageUploader
  
  def image_url
    answer_image.url
  end
  
  alias_method :img_url, :image_url
  alias_method :image, :image_url
end
