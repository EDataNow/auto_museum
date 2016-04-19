require 'rails_helper'

RSpec.describe "chapters/index", type: :view do

  before(:each) do
    @story = assign(:story, Story.create!(
    :title => "StoryTitle",
    :description => "MyText"
    ))
    assign(:chapters, [
      Chapter.create!(
        :title => "ChapterTitle",
        :position => 1,
        :video => "Video",
        :pdf => "Pdf",
        :audio => "Audio",
        :story => @story
      ),
      Chapter.create!(
        :title => "ChapterTitle",
        :position => 1,
        :video => "Video",
        :pdf => "Pdf",
        :audio => "Audio",
        :story => @story
      )
    ])
  end

  it "renders a list of chapters" do
    render
    assert_select "tr>td", :text => "ChapterTitle".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
    assert_select "tr>td", :text => "Pdf".to_s, :count => 2
    assert_select "tr>td", :text => "Audio".to_s, :count => 2
    assert_select "tr>td", :text => "StoryTitle".to_s, :count => 2
  end
end
