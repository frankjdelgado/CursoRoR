class Book < ActiveRecord::Base

	has_many :comments, dependent: :nullify

	def self.order_by_title
		order('title ASC')
	end

end
