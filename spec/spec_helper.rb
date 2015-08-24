ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('capybara/rspec')
require('pg')
require('employee')
require('division')

RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |employee|
      employee.destroy()
    end
  end
end
