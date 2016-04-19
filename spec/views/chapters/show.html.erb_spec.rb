require 'rails_helper'

RSpec.describe "chapters/show", type: :view do
  before(:each) do
    @chapter = assign(:chapter, Chapter.create!(
      :title => "Title",
      :position => 1,
      :video => "Video",
      :pdf => "Pdf",
      :audio => "Audio",
      :story => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Video/)
    expect(rendered).to match(/Pdf/)
    expect(rendered).to match(/Audio/)
    expect(rendered).to match(//)
  end
end
