require 'spec_helper'

describe "comments/new.html.haml" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :body => "MyString",
      :user => nil,
      :project => nil
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path, :method => "post" do
      assert_select "input#comment_body", :name => "comment[body]"
      assert_select "input#comment_user", :name => "comment[user]"
      assert_select "input#comment_project", :name => "comment[project]"
    end
  end
end
