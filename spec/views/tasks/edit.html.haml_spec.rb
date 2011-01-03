require 'spec_helper'

describe "tasks/edit.html.haml" do
  before(:each) do
    @task = assign(:task, stub_model(Task,
      :title => "MyString",
      :detail => "MyString",
      :done => false,
      :project => nil
    ))
  end

  it "renders the edit task form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => task_path(@task), :method => "post" do
      assert_select "input#task_title", :name => "task[title]"
      assert_select "input#task_detail", :name => "task[detail]"
      assert_select "input#task_done", :name => "task[done]"
      assert_select "input#task_project", :name => "task[project]"
    end
  end
end
