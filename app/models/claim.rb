class UniqueWithinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # is there a way to do this with uniqueness?  querying to do save kinda sucks...
    claims_with_postcode = Claim.where(attribute => value).created_within_months(options[:months])
    # why doesn't reject! work?
    # remove itself from the check
    claims_with_postcode = claims_with_postcode.reject {|claims| claims.id == record.id}
    if claims_with_postcode.size > 0
      record.errors[attribute] << "already has a claim within the past #{options[:months]} months."
    end
  end
end

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

  scope :created_within_months, lambda {|n| where(:created_at.gt => n.months.ago) }

  validates :claim_location_postcode, :unique_within => {:months => 6}
end
