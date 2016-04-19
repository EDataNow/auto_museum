class Story < ActiveRecord::Base
	has_many :chapters

	validates :title, :description, presence: true
	validates :title, uniqueness: true
end
