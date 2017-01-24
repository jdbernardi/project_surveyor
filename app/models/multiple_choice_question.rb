class MultipleChoiceQuestion < ApplicationRecord

	has_many :options, :as => :question
	has_many :answers
	belongs_to :survey


end
