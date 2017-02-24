class Employee
  attr_reader :name, :email, :phone, :salary

  def initialize(name, email, phone, salary)
    @name = name
    @email = email
    @phone = phone
    @salary = salary
  end


end
