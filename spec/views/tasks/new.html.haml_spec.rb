require 'spec_helper'

describe "tasks/new.html.haml" do
  before(:each) do
    assign(:task, stub_model(Task,
      :title => "MyString",
      :detail => "MyString",
      :done => false,
      :project => nil
    ).as_new_record)
  end

  it "renders new task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tasks_path, :method => "post" do
      assert_select "input#task_title", :name => "task[title]"
      assert_select "input#task_detail", :name => "task[detail]"
      assert_select "input#task_done", :name => "task[done]"
      assert_select "input#task_project", :name => "task[project]"
    end
  end
end
