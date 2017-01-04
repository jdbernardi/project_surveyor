class CreateRangeQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :range_questions do |t|

      t.timestamps
    end
  end
end
