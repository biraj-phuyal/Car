# frozen_string_literal: true

require_relative 'wheel'

class Car
    attr_accessor :name, :wheels

    def initialize(name, wheels)
        @name = name
        @wheels = wheels
    end

    def working?
        @wheels.all?(&:working?)
    end

    def drive
        @wheels.each(&:drive)
    end

    def repair
        @wheels.reject(&:working?).each(&:repair)
        # @wheels.each { |wheel| wheel.repair unless working? }
    end
end


# bmw_wheels = 4.times.map { Wheel.new }
# bmw = Car.new("BMW", bmw_wheels)

# bmw.drive
# bmw.wheels[0].health = 0

# bmw.repair

# array_of_healths = bmw.wheels.map { |wheel| wheel.health }

# puts "HEalths: #{array_of_healths.uniq}"