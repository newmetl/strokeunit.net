class LiveItem < StreamItem
  include Mongoid::MultiParameterAttributes
  
  field :title, :type => String
  field :location, :type => String
  field :date, :type => DateTime
  field :ticket, :type => String
  field :link, :type => String
  
  def self.coming_up_items
    LiveItem.where(:date.gte => DateTime.now).order_by([:date, :asc])
  end
  
  def self.past_items
    LiveItem.where(:date.lt => DateTime.now).order_by([:date, :desc])
  end
  
end