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

  def give_raise(dollars)
    number_of_shares = 0
    employees.each do |key, value|
      if value.satisfactory
        number_of_shares += 1
      end
    end
    employees.each do |key, value|
      if value.satisfactory && number_of_shares > 0
        value.give_raise(dollars/number_of_shares)
      end
    end
  end
end
