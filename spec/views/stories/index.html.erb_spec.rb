require 'rails_helper'

RSpec.describe "stories/index", type: :view do
  before(:each) do
    assign(:stories, [
      Story.create!(
        :title => "Title1",
        :description => "MyText"
      ),
      Story.create!(
        :title => "Title2",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of stories with unique names" do
    render
    assert_select "tr>td", :text => "Title1".to_s, :count => 1
    assert_select "tr>td", :text => "Title2".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end

end
