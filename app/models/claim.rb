class Claim
  include Mongoid::Document
  include Mongoid::Timestamps

  field :claim_type, :type => String
  field :active, :type => Boolean
  field :claim_location_postcode, :type => String
  field :cost, :type => Float
  field :date_of_loss, :type => Date

  has_many :customers
  embeds_many :notes
end
