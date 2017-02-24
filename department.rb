class Department
  attr_reader :name, :employees

  def initialize(name)
    @name = name
    @employees = {}
  end

  def add_employee(employee)
    employees[employee.name] = employee
  end

  def total_salary
    total = 0
    employees.each {|key, value| total += value.salary}
    total
  end
end
