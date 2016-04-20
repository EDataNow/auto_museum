class Story < ActiveRecord::Base
	has_many :chapters, ->() { order(position: :asc) }

	validates :title, :description, presence: true
	validates :title, uniqueness: true
end
