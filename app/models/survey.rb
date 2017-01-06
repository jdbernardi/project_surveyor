class Survey < ApplicationRecord

	validates :title, presence: true, uniqueness: true
	validates :description, presence: true


	has_many :questions
	has_many :answers


	accepts_nested_attributes_for :questions

end
