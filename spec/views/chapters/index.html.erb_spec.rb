require 'rails_helper'

RSpec.describe "chapters/index", type: :view do
  before(:each) do
    assign(:chapters, [
      Chapter.create!(
        :title => "Title",
        :position => 1,
        :video => "Video",
        :pdf => "Pdf",
        :audio => "Audio",
        :story => nil
      ),
      Chapter.create!(
        :title => "Title",
        :position => 1,
        :video => "Video",
        :pdf => "Pdf",
        :audio => "Audio",
        :story => nil
      )
    ])
  end

  it "renders a list of chapters" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Video".to_s, :count => 2
    assert_select "tr>td", :text => "Pdf".to_s, :count => 2
    assert_select "tr>td", :text => "Audio".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
