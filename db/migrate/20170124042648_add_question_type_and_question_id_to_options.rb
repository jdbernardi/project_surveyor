class AddQuestionTypeAndQuestionIdToOptions < ActiveRecord::Migration[5.0]
  def change
  	add_column :options, :question_type_id, :integer
  	add_column :options, :question_type, :string
  end
end
