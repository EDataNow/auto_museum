require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Test",
        :password => "password"
      ),
      User.create!(
        :name => "Test2",
        :password => "passowrd"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Test".to_s, :count => 1
    assert_select "tr>td", :text => "Test2".to_s, :count => 1
  end
end
