class Department
  attr_reader :name, :employees

  def initialize(name)
    @name = name
    @employees = {}
  end

  def add_employee(employee)
    employees[employee.name] = employee
  end
end
