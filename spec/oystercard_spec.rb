require 'oystercard'

describe Oystercard do
    subject(:oystercard) {described_class.new}

    it "oyster card has 0 as default value" do 
        expect(oystercard.balance).to eq(0)
    end 

    # it "oyster card loaded with 5 pounds" do 
    #     expect(oystercard.top_up(5)).to eq(5)
    # end 

    describe "#top_up" do
    
       #it { is_expected.to respond_to(:top_up).with(1).argument }

       it "can top up the balance" do
        expect{ subject.top_up 1 }.to change{subject.balance }.by 1
       end 

       it "raises an error if the maximun balance is exeeded" do
         maximum_balance = Oystercard::MAXIMUM_BALANCE
         oystercard.top_up(maximum_balance)
         expect{ subject.top_up 1 }.to raise_error "Maximum of #{maximum_balance} balance exceeded"
       end 
    end 

    describe "#deduct" do 

      it { is_expected.to respond_to(:deduct).with(1).argument }

      it "should be able to deduct from balance" do
        expect { subject.deduct(5) }.to change{ subject.balance }.by(-5)
      end 
  end 


end
