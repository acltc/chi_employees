require "chi_employees/version"
require "chi_employees/employee"
require 'unirest'

module ChiEmployees
  BASE_URL = "http://data.cityofchicago.org/resource/xzkq-xp2w.json"

  def self.all
    employee_hashes = Unirest.get(BASE_URL).body
    generate_employees(employee_hashes)
  end

  def self.where(hash)
    url = BASE_URL
    url += "?#{hash.keys.first}=#{hash.values.first}"
    employee_hashes = Unirest.get(url).body
    generate_employees(employee_hashes)
  end

  def self.generate_employees(employee_hashes)
    employees = []
    employee_hashes.each do |hash|
      employees << Employee.new(hash)
    end
    employees
  end
end
