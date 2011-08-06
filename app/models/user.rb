class User
  include Mongoid::Document
  include Mongoid::Timestamps
  
  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  
  field :name, :type => String
  field :admin, :type => Boolean, :default => false
  
end