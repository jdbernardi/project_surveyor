class RangeQuestion < ApplicationRecord

	belongs_to :survey
	has_many :options
	belongs_to :answer

end
