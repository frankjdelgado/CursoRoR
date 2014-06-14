class User < ActiveRecord::Base

	has_one :profile, dependent: :nullify
	has_many :comments
	has_and_belongs_to_many :books
	accepts_nested_attributes_for :profile

	#Validations
	validates :last_name, presence: true
	validates :email, presence: true

	def self.order_by_name
		order('name ASC')
	end

	def full_name
		[name, last_name].join(" ")
	end


end