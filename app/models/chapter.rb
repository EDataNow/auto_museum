class Chapter < ActiveRecord::Base
  belongs_to :story

  validates :title, :position, :story, presence: true

  def self.swap_position(chapter_a, chapter_b)
  	unless (chapter_a == nil or chapter_b == nil)
  		chapter_a.position, chapter_b.position = chapter_b.position, chapter_a.position
  		chapter_a.save
  		chapter_b.save
  	end
  end
end
