class Employee < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :timeoutable, :timeout_in => 60.minutes

  validates_presence_of :first_name, 
  						          :middle_name, 
            			      :last_name, 
            			      :password, 
            			      :department, :on => :create

  email_format = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  validates :email, :presence => true, 
  					:uniqueness => true,
  					:format => email_format

  scope :active, lambda { where(:active => true) }
  scope :inactive, lambda { where(:active => false) }
  scope :administrators, lambda { where(:admin => true) }
  scope :sort_by_last_name, lambda { order("last_name ASC") }

  def active_for_authentication?
	 super && self.active?
  end
  
end