class Group < ApplicationRecord
	has_many :memberships
	has_many :evaluates
	has_many :users, :through => :memberships
	belongs_to :course
end
