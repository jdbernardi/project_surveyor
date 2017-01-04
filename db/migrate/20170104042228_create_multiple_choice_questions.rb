class CreateMultipleChoiceQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :multiple_choice_questions do |t|

    	t.string :text

    	t.integer :question_id

    	t.boolean :multiple_allowed, :default => false

      t.timestamps
    end
  end
end
