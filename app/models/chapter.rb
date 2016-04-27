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
  validates_uniqueness_of :position, scope: :story

	validates :title, length: { minimum: 5 }
  validate :media_type

  # this breaks the ordering of chapters
  mount_uploader :video, VideoUploader
  mount_uploader :pdf, PdfUploader
  mount_uploader :audio, AudioUploader

  private
  def media_type
    unless video.present? ^ pdf.present? ^ audio.present?
      errors.add(:media_type, " At Least One media type is needed")
    end
  end


  def self.swap_position(chapter_a, chapter_b)
  	unless (chapter_a == nil or chapter_b == nil)
      @position_a = chapter_a.position
      @position_b = chapter_b.position
      chapter_a.position = chapter_a.story.chapters.count + 1
      chapter_a.save!(validate: false)
      chapter_b.position = @position_a
      chapter_b.save!(validate: false)
  		chapter_a.position = @position_b
  		chapter_a.save!(validate: false)
  	end
  end

  def self.get_chapter_above(chapter)
  	return chapter.story.chapters.find_by(position: chapter.position - 1)
  end

  def self.get_chapter_below(chapter)
  	return chapter.story.chapters.find_by(position: chapter.position + 1)
  end

  def self.rearange_chapter_list(chapters)

    chapters.each_with_index do |chapter, index|
      chapter.position = index + 1
      chapter.save!
    end
  end

end
