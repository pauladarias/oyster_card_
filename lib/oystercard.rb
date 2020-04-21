class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    attr_reader :balance, :entry_station, :journey

    def initialize
        @balance = 0
        @entry_station = nil
        @journey = []
    end 

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end 

    def touch_in (station)
        fail "Balance too low" if balance < MINIMUM_FARE
        @entry_station = station
    end 

    def touch_out(station)
        fail "Please touch in first" if !in_journey 
        deduct(MINIMUM_FARE)
        @journey << {"entrystation" => entry_station, "exitstation" => station}
        @entry_station = nil
    end

    def in_journey
        if entry_station == nil
            false 
        else 
            true
        end 
    end 

    private
    def deduct(ammount)
        @balance -= ammount
    end 
end 