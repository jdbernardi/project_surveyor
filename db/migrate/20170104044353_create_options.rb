class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|

    	t.integer :question_id
    	t.integer :survey_id

      t.timestamps
    end
  end
end
