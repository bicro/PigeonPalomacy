class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.text :subcontent, default: ""

      t.timestamps null: false
    end
  end
end
