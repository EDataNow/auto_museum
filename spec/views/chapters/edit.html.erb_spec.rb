require 'rails_helper'

RSpec.describe "chapters/edit", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :title => "Title",
      :description => "MyText"
    ))
    @chapter = assign(:chapter, Chapter.create!(
      :title => "MyString",
      :position => 1,
      :video => "MyString",
      :pdf => "MyString",
      :audio => "MyString",
      :story => @story
    ))
  end

  it "renders the edit chapter form" do
    render

    assert_select "form[action=?][method=?]", chapter_path(@chapter), "post" do

      assert_select "input#chapter_title[name=?]", "chapter[title]"

      assert_select "input#chapter_position[name=?]", "chapter[position]"

      assert_select "input#chapter_video[name=?]", "chapter[video]"

      assert_select "input#chapter_pdf[name=?]", "chapter[pdf]"

      assert_select "input#chapter_audio[name=?]", "chapter[audio]"

      assert_select "input#chapter_story_id[name=?]", "chapter[story_id]"
    end
  end
end
