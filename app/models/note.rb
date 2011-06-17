class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :author_name, :type => String
  field :body_text, :type => String
  
  attr_accessible :author_name, :body_text
  embedded_in :claim
end
