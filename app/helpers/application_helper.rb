module ApplicationHelper
  
  require 'rdiscount'
  
  def markdown(text)
    text = '' if text.nil?
    markup = RDiscount.new(text).to_html
    markup.html_safe
  end
  
end
