class User < ApplicationRecord
	
  
	validates :first_name, presence: true, length: {minimum: 5}
	validates :last_name, presence: true, length: {minimum: 5}
	validates :email, :presence => true, :format => { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	
  
  
 
  
	def self.authenticate(first_name, password)
		user = find_by_first_name(first_name)
		if user && user.password == password
      user
		else
			nil
		end
	end
	
	def encrypt_password
		if password.present?
			self.password = password
		end
	end
  
end
