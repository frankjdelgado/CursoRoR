class Book < ActiveRecord::Base

	has_many :comments, dependent: :nullify

	#accepts_nested_attributes_for :comments

	def self.order_by_title
		order('title ASC')
	end

end
