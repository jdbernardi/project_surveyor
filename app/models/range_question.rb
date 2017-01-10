class RangeQuestion < ApplicationRecord

	belongs_to :question, optional: true
	has_many :options
	belongs_to :answer

end
