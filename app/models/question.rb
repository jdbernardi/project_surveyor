class Question < ApplicationRecord

	belongs_to :survey
	belongs_to :multiple_choices
	belongs_to :range_questions
	has_many :options, through: :multiple_choices
	has_many :options, through: :range_questions
	has_many :answers


	accepts_nested_attributes_for :multiple_choice, :option, :range_question

end
