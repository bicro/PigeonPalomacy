class AddExpertScoreToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :expert_score, :float
  end
end
