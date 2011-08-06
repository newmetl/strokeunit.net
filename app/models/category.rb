class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, :type => String
  validates_presence_of :name
  
  has_many :stream_items, :dependent => :delete
  

end