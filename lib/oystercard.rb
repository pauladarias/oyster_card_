class Oystercard
    MAXIMUM_BALANCE = 90

    attr_reader :balance

    def initialize
        @balance = 0
    end 

    def top_up(ammount)
        fail "Maximum of #{MAXIMUM_BALANCE} balance exceeded" if balance + ammount > MAXIMUM_BALANCE
        @balance += ammount
    end 

    def deduct(ammount)
        @balance -= ammount
    end 
end 