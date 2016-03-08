class CreateSubmissionAnswers < ActiveRecord::Migration
  def change
    create_table :submission_answers do |t|
      t.references :submission, index: true, foreign_key: true
      t.references :answer, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
