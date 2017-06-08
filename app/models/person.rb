class Person < ActiveRecord::Base

  def say_hi
    puts "Hi #{name}"
  end
end
