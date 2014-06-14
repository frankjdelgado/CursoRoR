class Profile < ActiveRecord::Base

	belongs_to :user

	validates :zipcode, presence: true
	validate :zip

	private

	def zip
		errors.add(:base, "Zipcode must be even") unless zipcode.even?
	end

end