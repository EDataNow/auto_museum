require 'rails_helper'

RSpec.describe "stories/edit", type: :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "input#story_name[name=?]", "story[name]"

      assert_select "textarea#story_description[name=?]", "story[description]"
    end
  end
end
