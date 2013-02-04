class User < ActiveRecord::Base
  attr_accessible :email, :name
  has_many :microposts
  
  def initialize(attributes={})
    @name = attribute[:name]
    @email = attribute[:email]
  end
    
   def formatted_email
     "#{@name} <#{@email}>"
   end
end

