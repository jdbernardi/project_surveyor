class RemoveQuestionTypeIdFromOptions < ActiveRecord::Migration[5.0]
  def change
  	remove_column :options, :question_type_id, :integer
  end
end
