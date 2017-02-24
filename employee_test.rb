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

  def test_add_employee_review
    review_paragraph = "I was once called the worst audience participant Cirque du Soleil ever had. Fried cheese… with club sauce. George Bush doesn't care about black puppets. I could use a leather jacket for when I'm on my hog and have to go into a controlled slide. Happy."
    bob.review = review_paragraph

    assert_equal review_paragraph.length, bob.review.length
  end

  def test_employee_satisfying
    starting_value = bob.satisfactory
    bob.toggle_satisfaction

    refute_equal starting_value, bob.satisfactory
  end

  def test_give_raise_raises_salary
    starting_value = bob.salary
    bob.give_raise(500)

    assert_equal starting_value + 500, bob.salary
  end
end
