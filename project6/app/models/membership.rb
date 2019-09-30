class Membership < ApplicationRecord
	belongs_to :user
	belongs_to :group

	validate :validate_group_id
	validate :validate_user_id
	
	private
	   def validate_group_id
	      errors.add(:group_id, "does not exist") unless Group.exists?(self.group_id)
	   end
	private	
	   def validate_user_id
	      errors.add(:user_id, "does not exist") unless User.exists?(self.user_id)
	   end
end
