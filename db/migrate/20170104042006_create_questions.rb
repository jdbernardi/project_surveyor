class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|

    	t.integer :survey_id
    	t.string :question
    	t.boolean :required, :default => false

      t.timestamps
    end
  end
end
