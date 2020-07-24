class Section < ActiveRecord::Base
 belongs_to :post

 def display
  contents["display"]
 end
end 