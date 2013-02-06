# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  #we need to add password and password_confirmation attributes, 
  #require the presence of the password, require that they match, and add 
  #an authenticate method to compare an encrypted password to the password_digest 
  #to authenticate users. This is the only nontrivial step, and in the latest version 
  #of Rails all these features come for free with one method, has_secure_password:
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validate :name, present: true, length: {maximum:100}
  validate :password, present: true, lenght: {minimum:6}
  validate :password_confirmation, present: true
  
  before_save do |user|
     user.email = email.downcase
   end
   
  has_many :microposts
 
    
   def formatted_email
     "#{name.to_s} <#{email.to_s}>"
   end
   
   
   
end

