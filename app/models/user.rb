class User < ActiveRecord::Base
  
  has_attached_file :avatar,
    :style => {:medium => "300x300>", :thumb => "100x100>"} 
 # :storage => :database
  has_many :articals
  has_many :comments
  validates :name, :presence => true
  validates :password, :presence => true, :length => {:minimum => 6, :message => "Password must be minimum 6 characters"}
  validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

end
