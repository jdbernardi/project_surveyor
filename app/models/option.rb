class Option < ApplicationRecord


	belongs_to :multiple_choice_questions
	belongs_to :range_questions

	belongs_to :survey


end


