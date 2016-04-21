class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  
  validates :street_address_1, :city, :state, :zipcode, :country, :preferred_contact, :expertise_description, presence: true
  
  before_save :infer_address_and_coordinates

  def active_for_authentication?
    super && approved?
  end
  
  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end
  
  def send_account_approved_email
    AccountApprovedMailer.account_approved_email(self).deliver
  end
  
  private
  
    def infer_address_and_coordinates
      results = Geocoder.search(build_clean_address(self))
      if results.size != 0
        loc = results.first
        self.latitude = loc.latitude
        self.longitude = loc.longitude
        self.inferred_address = loc.formatted_address
      else
        errors.add(:base,'Invalid address')
        raise ActiveRecord::RecordInvalid.new(self)
      end
    end
    
    def build_clean_address(record)
      [record.street_address_1,record.street_address_2,record.city,record.state,record.zipcode,record.country].to_a.compact.join(",")
    end
  
end
