class Claim
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :claim_type, :type => String
  field :active, :type => Boolean
  field :claim_location_postcode, :type => String
  field :customer_name, :type => String
  field :customer_postcode, :type => String
  field :customer_phone, :type => String
  field :customer_dob, :type => Date
  field :cost, :type => Float
  field :date_of_loss, :type => Date
end
