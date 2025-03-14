# frozen_string_literal: true

class Wheel
    attr_accessor :health

    def initialize
        @health = 10
    end

    def working?
        @health.positive?
    end

    def drive
        throw "Wheel driven while broken" unless working?
        @health -= 1 
    end

    def repair
        throw "Wheel ain't broken" if working?
        @health = 10 if health == 0
    end
end
