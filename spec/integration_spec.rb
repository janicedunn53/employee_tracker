require("spec_helper")
require("./app")

Capybara.app = Sinatra::Application
# set(:show_exceptions, false)

describe("/employees", {:type => :feature}) do
  it("will display all employees and allow user to add an employee") do
    # test_employee = Employee.new({:name => "John", :gender => "male", :age => 25})
    # test_employee.save()
    visit("/employees")
    fill_in("name", :with => "John")
    fill_in("gender", :with => "male")
    fill_in("age", :with => 25)
    click_button("Add employee")
    expect(page).to have_content("John")
  end
end
