# t.string   "title"
# t.text     "description"

class Story < ActiveRecord::Base
	has_many :chapters, ->() { order(position: :asc) }

	validates :title, :description, presence: true
	validates :title, uniqueness: true
	validates :description, :title, length: { minimum: 5 }
end
