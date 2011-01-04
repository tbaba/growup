require 'spec_helper'

describe "comments/edit.html.haml" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :body => "MyString",
      :user => nil,
      :project => nil
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comment_path(@comment), :method => "post" do
      assert_select "input#comment_body", :name => "comment[body]"
      assert_select "input#comment_user", :name => "comment[user]"
      assert_select "input#comment_project", :name => "comment[project]"
    end
  end
end
