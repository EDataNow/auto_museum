class Story < ActiveRecord::Base
	has_many :chapters

	validates :name, :description, presence: true
	validates :name, uniqueness: true
end
