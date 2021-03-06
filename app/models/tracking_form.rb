class TrackingForm < ActiveRecord::Base

  has_many :form_histories, dependent: :destroy
  has_many :form_remarks, dependent: :destroy

  before_create :set_status

  validates_uniqueness_of :uid
  validates_numericality_of :amount
  validates_presence_of :transaction_name, 
                  			:department,
                        :transaction_type,
                  			:date_filed,
                        :prepared_by,
                  			:current_dept

  validates_presence_of :pending_information, :if => :pending, :on => [ :create, :update ]
  validates_absence_of :complete_docs, :if => :pending, :on => [ :create, :update ]
  validates_absence_of :pending_information, :unless => :pending

  scope :pending, lambda { where(:pending => true) }

  def self.search(query)
    where("transaction_name LIKE ?", "%#{query}%") 
  end
  
  protected

    def set_status
      self.recently_created = true
    end
   
end
