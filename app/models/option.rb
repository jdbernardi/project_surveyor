class Option < ApplicationRecord

	belongs_to :question
	has_many :multiple_choice_questions
	has_many :range_questions


end
