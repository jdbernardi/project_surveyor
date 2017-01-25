class MultipleChoiceQuestion < ApplicationRecord

	has_many :options, :as => :question
	has_many :answers
	belongs_to :survey

	accepts_nested_attributes_for :options, :reject_if => :all_blank


end
