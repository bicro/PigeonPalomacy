class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true, foreign_key: true
      t.string :content
      t.string :img_url, default: ""

      t.timestamps null: false
    end
  end
end
