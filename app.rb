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

get("/employees") do
  @employees = Employee.all()
  erb(:employees)
end

post("/employees") do
  name = params.fetch("name")
  gender = params.fetch("gender")
  age = params.fetch("age").to_i()
  new_employee = Employee.new({:name => name, :gender => gender, :age => age})
  new_employee.save()
  @employees = Employee.all()
  erb(:employees)
end
