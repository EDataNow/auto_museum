require 'rails_helper'

RSpec.describe Chapter, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_attributes) {
    {
         title:   'StoryChapter',
      position:   1,
         video:   'img/video.mp4',
           pdf:   'pdf/pdf.pdf',
         audio:   'audio/audio.mp3',
         story:   1

    }
  }
  let(:invalid_attributes) {
    {
         title:   '',
      position:   nil,
         video:   '',
           pdf:   '',
         audio:   '',
         story:   nil

    }
  }

  describe "| insertions |" do
    it "attributes can't be blank" do
      story = Chapter.new

      assert story.invalid?
      assert story.errors[:title].any?
      assert story.errors[:position].any?
      assert story.errors[:media_type].any?
      assert story.errors[:story].any?
    end

    it "story title minimum is 5 characters"  do
      story = Chapter.new invalid_attributes

      assert story.invalid?
      assert story.errors[:title].any?
    end
  end
end
