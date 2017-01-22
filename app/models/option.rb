class Option < ApplicationRecord


	has_many :multiple_choice_questions
	has_many :range_questions

	belongs_to :survey


end
