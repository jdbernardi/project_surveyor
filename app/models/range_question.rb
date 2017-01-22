class RangeQuestion < ApplicationRecord

	belongs_to :question
	has_many :options
	belongs_to :answer

end
