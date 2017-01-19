class Question < ApplicationRecord

	belongs_to :survey, optional: true
	belongs_to :multiple_choice_question, optional: true
	belongs_to :range_question, optional: true
	has_many :options, through: :multiple_choices
	has_many :options, through: :range_questions
	has_many :options
	has_many :answers



	accepts_nested_attributes_for :multiple_choice_question, :options, :range_question

end
