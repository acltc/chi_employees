require "chi_employees/version"
require "chi_employees/employee"
require 'unirest'

module ChiEmployees
  def self.all
    employee_hashes = Unirest.get("http://data.cityofchicago.org/resource/xzkq-xp2w.json").body
    employees = []
    employee_hashes.each do |hash|
      employees << Employee.new(hash)
    end
    employees
  end
end
