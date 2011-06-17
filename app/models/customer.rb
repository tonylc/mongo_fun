class Customer
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  field :postcode, :type => String
  field :phone, :type => String
  field :dob, :type => Date
  
  attr_accessible :name, :postcode, :phone, :dob
  belongs_to :claim
end
