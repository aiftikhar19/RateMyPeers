class Evaluate < ApplicationRecord
	belongs_to :user
	belongs_to :group
	has_many :ratings
end
