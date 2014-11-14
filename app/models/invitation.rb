class Invitation < ActiveRecord::Base
	belongs_to :user
	belongs_to :company
	belongs_to :quote

	
end
