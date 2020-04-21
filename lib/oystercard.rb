class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    attr_reader :balance, :entry_station

    def initialize
        @balance = 0
        @entry_station = nil
    end 

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end 

    def touch_in (station)
        fail "Balance too low" if balance < MINIMUM_FARE
        @in_journey = true
        @entry_station = station
    end 

    def touch_out
        fail "Please touch in first" if !in_journey 
        deduct(MINIMUM_FARE)
        @in_journey = false
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