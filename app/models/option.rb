class Option < ApplicationRecord

	belongs_to :question
	has_many :multiple_choices
	has_many :range_questions


end
