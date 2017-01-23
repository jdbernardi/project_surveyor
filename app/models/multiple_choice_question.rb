class MultipleChoiceQuestion < ApplicationRecord

	has_many :options
	has_many :answers
	belongs_to :survey


end
