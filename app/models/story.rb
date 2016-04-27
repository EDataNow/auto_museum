# t.string   "title"
# t.text     "description"

class Story < ActiveRecord::Base
	has_many :chapters, ->() { order(position: :asc) }

	validates :title, :description, presence: true
	validates :title, uniqueness: true
	validates :description, :title, length: { minimum: 5 }


	def self.rearange_story_list(stories)

    stories.each_with_index do |story, index|
      story.position = index + 1
      story.save!
    end
  end
end
