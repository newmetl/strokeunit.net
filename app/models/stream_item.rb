class StreamItem
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :title, :type => String
  validates_presence_of :title
  
  belongs_to :user, :inverse_of => :stream_items
  validates_presence_of :user
  
end