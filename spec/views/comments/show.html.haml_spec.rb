require 'spec_helper'

describe "comments/show.html.haml" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :body => "Body",
      :user => nil,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Body/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
