class Question < ApplicationRecord

	belongs_to :survey
	has_many :multiple_choice_questions
	has_many :range_questions
	has_many :options, through: :multiple_choice_questions
	has_many :options, through: :range_questions
	has_many :options
	has_many :answers



	accepts_nested_attributes_for :multiple_choice_questions, :options, :range_questions

end
