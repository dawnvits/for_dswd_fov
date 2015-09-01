class FormRemark < ActiveRecord::Base
	
	belongs_to :tracking_form
	validates_presence_of :content
	
end