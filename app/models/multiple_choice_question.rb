class MultipleChoiceQuestion < ApplicationRecord

	validates :text, presence: true

	has_many :options
	has_many :answers
	belongs_to :survey


end
