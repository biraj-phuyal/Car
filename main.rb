# frozen_string_literal: true

require_relative 'car'

# A Wheels should be drivable for 10 drives
# Car should throw if driven with a borken wheel
# Wheel shoud throw if driven broken
# Car repair should only repair borken wheels
# Wheel repair should throw if wheel is not broken
# Wheel health should start at 10
# Wheel repair should bring wheel health to 10
# When driven wheel should degrade one health value

puts 'Creating Ferrari with 4 wheels'
ferrari_wheels = 4.times.map { Wheel.new }
ferrari = Car.new('Ferrari', ferrari_wheels)

puts "Is Ferrari working? #{ferrari.working?}"
throw(:fail) unless ferrari.working?

puts 'Driving Ferrari 9 times.'
9.times { ferrari.drive }

puts "Is Ferrari working? #{ferrari.working?}"
throw(:fail) unless ferrari.working?

puts 'Driving Ferrari 1 time.'
ferrari.drive

puts "Is Ferrari working? #{ferrari.working?}"
throw(:fail) if ferrari.working?

puts 'Repairing Ferrari.'
ferrari.repair

puts "Is Ferrari working? #{ferrari.working?}"
throw(:fail) unless ferrari.working?

puts 'Driving Ferrari 1 time.'
ferrari.drive

puts 'Breaking single wheel.'
ferrari.wheels[0].health = 0
throw(:fail) if ferrari.working?

puts 'Repairing Ferrari.'
ferrari.repair

matches = ferrari.wheels.map(&:health).uniq[0] == 10 && ferrari.wheels.map(&:health).uniq[1] == 9
puts "Only repaired the broken wheel? #{matches}"
throw(:fail) unless matches

puts "\033[1;32mCongrats you passed all the tests!\033[1m 🎉🥳🎊🎁"
