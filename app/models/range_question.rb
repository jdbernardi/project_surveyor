class RangeQuestion < ApplicationRecord

	belongs_to :survey
	has_many :options,  :as => :questionable
	belongs_to :answer

	accepts_nested_attributes_for :options


end
