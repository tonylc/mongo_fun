class UniqueWithinValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # do i need to handle case insensitivity?
    if Claim.where(attribute => value).created_within_months(options[:months]).excludes(:id => record.id).exists?
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
