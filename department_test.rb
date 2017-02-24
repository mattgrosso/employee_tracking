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

  def lisa
    @lisa ||= Employee.new("Lisa", "lisa@lisa.com", "3333333333", 40000)
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

  def test_give_raise
    sales.add_employee(bob)
    sales.add_employee(sue)
    sales.add_employee(lisa)
    sue_starting_salary = sue.salary
    bob_starting_salary = bob.salary
    bob.toggle_satisfaction
    starting_total_salary = sales.total_salary
    sales.give_raise(2000)

    assert_equal starting_total_salary + 2000, sales.total_salary
    assert_equal sue_starting_salary + 1000, sue.salary
    assert_equal bob_starting_salary, bob.salary
  end
end
