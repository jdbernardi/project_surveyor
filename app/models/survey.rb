class Survey < ApplicationRecord

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true


	has_many :questions
	has_many :answers
	has_many :multiple_choice_questions, through: :questions
	has_many :range_questions, through: :questions

	has_many :options, through: :questions


	accepts_nested_attributes_for :questions, :options

end
