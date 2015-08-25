require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
require("./lib/employee")
require("./lib/division")
require("pg")
also_reload("/lib/**/*.rb")

get("/") do
  erb(:index)
end

get("/divisions") do
  @divisions = Division.all()
  erb(:divisions)
end

post("/divisions") do
  name = params.fetch("name")
  new_division = Division.new({:name => name})
  new_division.save()
  @divisions = Division.all()
  erb(:divisions)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

get("/divisions/:id/edit") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch("/divisions/:id") do
  name = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => name})
  @divisions = Division.all()
  erb(:divisions)
end

delete("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  @division.destroy()
  @divisions = Division.all()
  erb(:divisions)
end

get("/employees") do
  @employees = Employee.all()
  erb(:employees)
end

post("/employees") do
  name = params.fetch("name")
  gender = params.fetch("gender")
  age = params.fetch("age").to_i()
  division_id = params.fetch("division_id").to_i()
  new_employee = Employee.new({:name => name, :gender => gender, :age => age, :division_id => division_id})
  new_employee.save()
  @employees = Employee.all()
  erb(:employees)
end

get("/employees/:id/edit") do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  gender = params.fetch("gender")
  age = params.fetch("age").to_i()
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name, :gender => gender, :age => age})
  @employees = Employee.all()
  erb(:employees)
end

delete("/employees/:id") do
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.destroy()
  @employees = Employee.all()
  erb(:employees)
end
