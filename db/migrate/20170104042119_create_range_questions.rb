class CreateRangeQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :range_questions do |t|

    	t.integer :minimum
    	t.integer :maximum

    	t.integer :question_id

      t.timestamps
    end
  end
end
