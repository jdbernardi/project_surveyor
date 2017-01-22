class Answer < ApplicationRecord

	belongs_to :survey
	belongs_to :multiple_choice_question
	belongs_to :range_question
	has_many :options

end
