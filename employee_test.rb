require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require_relative "employee"

class EmployeeTest < Minitest::Test
  def bob
    @bob ||= Employee.new("Bob", "bob@bob.com", "5555555555", 10000)
  end

  def test_employee_exists
    assert Employee
  end

  def test_employee_has_properties
    assert_equal "Bob", bob.name
    assert_equal "bob@bob.com", bob.email
    assert_equal "5555555555", bob.phone
    assert_equal 10000, bob.salary
  end
end
