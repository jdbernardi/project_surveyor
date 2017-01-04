class MultipleChoiceQuestion < ApplicationRecord

	belongs_to :question
	has_many :options
	has_many :answers


end
