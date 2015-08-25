require('spec_helper')

describe(Division) do
  describe('#employees') do
    it("tells which employees are in the division") do
      test_division = Division.create({:name => "Sales"})
      test_employee1 = Employee.create({:name => "Matt", :gender => "male", :age => 35, :division_id => test_division.id})
      test_employee2 = Employee.create({:name => "Frank", :gender => "male", :age => 46, :division_id => test_division.id})
      expect(test_division.employees()).to(eq([test_employee1, test_employee2]))
    end
  end
end
