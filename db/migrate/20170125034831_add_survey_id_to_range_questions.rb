class AddSurveyIdToRangeQuestions < ActiveRecord::Migration[5.0]
  def change
  	add_column :range_questions, :survey_id, :integer
  end
end
