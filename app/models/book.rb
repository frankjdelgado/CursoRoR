class Book < ActiveRecord::Base

	has_many :comments, dependent: :nullify
	has_and_belongs_to_many :users
	#accepts_nested_attributes_for :comments

	def self.order_by_title
		order('title ASC')
	end

end
