class User < ActiveRecord::Base

	has_one :profile
	has_many :comments

	def self.order_by_name
		
		order('name ASC')
	end

end