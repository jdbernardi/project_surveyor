class AddSurveyIdToMultipleChoiceQuestions < ActiveRecord::Migration[5.0]
  def change
  	add_column :multiple_choice_questions, :survey_id, :integer
  	add_column :multiple_choice_questions, :required, :boolean
  	remove_column :multiple_choice_questions, :question_id, :integer
  end
end
