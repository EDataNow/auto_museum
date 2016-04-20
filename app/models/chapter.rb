# t.string   "title"
# t.integer  "position"
# t.string   "video"
# t.string   "pdf"
# t.string   "audio"
# t.integer  "story_id"

class Chapter < ActiveRecord::Base

  belongs_to :story
# Think about how necessary it is to have uniqueness accross chapters
# for media_type
  validates :title, :position, :story,  presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 5 }

  validate :media_type

  # this breaks the ordering of chapters
  #mount_uploader :video, VideoUploader

  private

  def media_type
    require 'uri'

    any_invalid = [video, pdf, audio].any? do |media_type|
      media_type_valid?(media_type) == false
    end
# errors are a hash and by adding :media_type as a key it allows me to
# use to search within the assert tests.
    if any_invalid
      errors.add(:media_type, 'At Least One of Pdf, Video or Audit is needed')
    end
  end

  def self.swap_position(chapter_a, chapter_b)
  	unless (chapter_a == nil or chapter_b == nil)
  		chapter_a.position, chapter_b.position = chapter_b.position, chapter_a.position
  		chapter_a.save
  		chapter_b.save
  	end
  end

  def self.get_chapter_above(chapter)
  	return chapter.story.chapters.find_by(position: chapter.position - 1)
  end

  def self.get_chapter_below(chapter)
  	return chapter.story.chapters.find_by(position: chapter.position + 1)
  end

  def media_type_valid?(media_type)
    media_type.present?
  end
end
