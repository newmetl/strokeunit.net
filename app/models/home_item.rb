class HomeItem < StreamItem
  
  field :text, :type => String
  field :pic_align, :type => String
  mount_uploader :pic, ImageUploader
  
end