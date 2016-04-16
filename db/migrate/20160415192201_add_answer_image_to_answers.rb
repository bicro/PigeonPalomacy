class AddAnswerImageToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :answer_image, :string
  end
end
