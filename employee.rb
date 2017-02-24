class Employee
  attr_reader :name, :email, :phone, :salary
  attr_accessor :review, :satisfactory

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
    @satisfactory = true
  end

  def toggle_satisfaction
    @satisfactory = !@satisfactory
  end
end
