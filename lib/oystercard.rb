class Oystercard
    MAXIMUM_BALANCE = 90
    MINIMUM_FARE = 1

    attr_reader :balance, :in_journey

    def initialize
        @balance = 0
        @in_journey = false
    end 

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end 

    def deduct(ammount)
        @balance -= ammount
    end 

    def touch_in 
        fail "Balance too low" if @balance < MINIMUM_FARE
        @in_journey = true
    end 

    def touch_out
        @in_journey = false
    end
end 