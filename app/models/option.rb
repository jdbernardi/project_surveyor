class Option < ApplicationRecord


	belongs_to :multiple_choice_question, class_name: "MultipleChoiceQuestion", foreign_key: "question_id"
	belongs_to :range_question, foreign_key: "question_id"

	belongs_to :survey


end


