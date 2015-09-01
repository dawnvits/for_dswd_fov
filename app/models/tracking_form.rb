class TrackingForm < ActiveRecord::Base

  has_many :form_histories, dependent: :destroy
  has_many :form_remarks, dependent: :destroy

  before_create :set_status

  validates_uniqueness_of :uid
  validates_numericality_of :amount_to_be_claimed
  validates_presence_of :transaction_name, 
                  			:department,
                  			:date_filed,
                        :prepared_by,
                  			:current_dept

  validates_presence_of :pending_info, :unless => :approved_by_division_chief, :on => [ :create, :update ]
  validates_absence_of :pending_info, :if => :approved_by_division_chief

  def self.search(query)
    where("uid like ?", "%#{query}%") 
  end
  
  protected

    def set_status
      self.recently_created = true
    end
   
end
