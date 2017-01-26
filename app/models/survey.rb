class Survey < ApplicationRecord

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true



	has_many :answers
	has_many :multiple_choice_questions
	has_many :range_questions


	accepts_nested_attributes_for :multiple_choice_questions, :range_questions

end
