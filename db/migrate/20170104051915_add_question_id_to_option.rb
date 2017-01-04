class AddQuestionIdToOption < ActiveRecord::Migration[5.0]
  def change
  	add_column :options, :question_id, :integer
  end
end
