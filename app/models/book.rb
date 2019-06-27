class Book < ApplicationRecord
	def self.search(search)		
		if search			
			Book.where("name LIKE '%#{search}%'")			
		else			
			Book.all
		end		
	end
end
