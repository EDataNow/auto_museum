require 'rails_helper'

RSpec.describe Story, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:valid_attributes) {
    {
      title: 'StoryChapter',
      description: 'StoryDescription'
    }
  }
  let(:invalid_attributes) {
    {
      title: 'sdsd',
      description: 'sdfd'
    }
  }

  describe "| Story Insertions |" do
    it "story attributes can't be blank" do
      story = Story.new

      assert story.invalid?
      assert story.errors[:title].any?
      assert story.errors[:description].any?
    end

    it "story description minimum is 5 characters"  do
      story = Story.new invalid_attributes
      assert story.invalid?
      assert story.errors[:title].any?
      assert story.errors[:description].any?
    end
  end
end
