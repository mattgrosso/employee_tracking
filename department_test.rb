require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require_relative "department"
require_relative "employee"

class DepartmentTest < Minitest::Test
  def sales
    @sales ||= Department.new("sales")
  end

  def bob
    @bob ||= Employee.new("Bob", "bob@bob.com", "5555555555", 10000)
  end

  def sue
    @sue ||= Employee.new("Sue", "sue@sue.com", "4444444444", 20000)
  end

  def test_department_exists
    assert Department
  end

  def test_department_has_name
    assert_equal "sales", sales.name
  end

  def test_department_can_add_employee
    assert sales.employees

    employee_count = sales.employees.length
    sales.add_employee(bob)

    assert_equal employee_count, sales.employees.length - 1
  end

  def test_total_department_salary
    sales.add_employee(bob)
    sales.add_employee(sue)

    assert_equal 30000, sales.total_salary

  end
end
