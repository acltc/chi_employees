module ChiEmployees
  class Employee
    attr_accessor :job_titles, :department, :name, :employee_annual_salary

    def initialize(hash)
      @job_titles = hash["job_titles"]
      @department = hash["department"]
      @name = hash["name"]
      @employee_annual_salary = hash["employee_annual_salary"]
    end
  end
end
