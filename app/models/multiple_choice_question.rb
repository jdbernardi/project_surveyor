class MultipleChoiceQuestion < ApplicationRecord

	belongs_to :question, optional: true
	has_many :options
	has_many :answers


end
