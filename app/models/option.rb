class Option < ApplicationRecord

	belongs_to :question
	has_many :multiple_choice_questions
	has_many :range_questions

	belongs_to :survey, optional: true


end
