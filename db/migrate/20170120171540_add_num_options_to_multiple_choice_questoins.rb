class AddNumOptionsToMultipleChoiceQuestoins < ActiveRecord::Migration[5.0]
  def change
  	add_column :multiple_choice_questions, :num_options, :integer
  end
end
