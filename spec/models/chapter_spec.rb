require 'rails_helper'

RSpec.describe Chapter, type: :model do

  before do
    Story.destroy_all
  end

  let(:story) { Story.create!(
          title:   "StoryTitle",
    description:   "StoryDescription"
    )
  }
  let(:valid_attributes) {
    {
         title:   'StoryChapter',
      position:   1,
         video:   'img/video.mp4',
           pdf:   'pdf/pdf.pdf',
         audio:   'audio/audio.mp3',
         story:   story

    }
  }
  let(:invalid_title_attributes) {
    {
         title:   'sadd',
      position:   nil,
         video:   '',
           pdf:   '',
         audio:   '',
         story:   nil

    }
  }

  describe "| insertions |" do
    it "attributes can't be blank" do
      chapter = Chapter.new

      assert chapter.invalid?
      assert chapter.errors[:title].any?
      assert chapter.errors[:position].any?
      assert chapter.errors[:media_type].any?
      assert chapter.errors[:story].any?
    end

    it "title minimum is 5 characters"  do
      chapter = Chapter.new invalid_title_attributes

      assert chapter.invalid?
      assert chapter.errors[:title].any?
    end

    it "position is unique" do
      #this should fail can't have two chapters
      #in the same story with the same position
      chapter = Chapter.new valid_attributes
      chapter2 = Chapter.new valid_attributes

      assert_equal chapter.position, chapter2.position
      assert chapter2.valid?

    end

  end
end
