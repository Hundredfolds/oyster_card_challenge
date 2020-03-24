require './lib/oystercard'

describe Oystercard do
  let(:card) { Oystercard.new }
  let(:new_card) { Oystercard.new(50) }
  describe 'balance' do
    it "should respond to balance" do
      expect(card).to respond_to(:balance)
    end
    it "balance should respond to class with an integer" do
      expect(card.balance.class).to eq(Integer)
    end
    it "should respond to top_up" do
      expect(card).to respond_to(:top_up)
    end
    it "balance should be increased by topping up" do
      y = new_card.balance
      x = 10
      expect { new_card.top_up(x) }.to change { new_card.balance }.from(y).to(x+y)
    end
    it "doesn't top up past limit" do
      card_limit = 90
      expect { card.top_up(card_limit + 1)  }.to raise_error "you cannot top up #{card_limit + 1} as it brings your card over the limit"
    end
    #it "should respond to deduct" do
    #  expect(card).to respond_to(:deduct)
    #end
    it "balance should be decreased by deduct" do
      y = new_card.balance
      new_card.send(:deduct)
      expect(new_card.balance).to be < (y)
    end
  end
  describe 'touching in/out/hokeykokey' do
    it " should be able to touch into system" do
      expect(card).to respond_to(:touch_in)
    end
    it "Touch in updates your status in the system to true" do
      card.touch_in
      expect(card.in_system).to eq(true)
    end
    it " should be able to touch out of system" do
      expect(card).to respond_to(:touch_out)
    end
    it "Touch out updates your status in the system to false" do
      card.touch_out
      expect(card.in_system).to eq(false)
    end
    it "should be able to let you know if it's in a journey" do
      expect(card.in_journey?).to eq(true).or eq(false)
    end
    it "should return true if you are in the system" do
      card.touch_in
      expect(card.in_journey?).to eq(true)
    end
    it "should return false if you are out the system" do
      card.touch_out
      expect(card.in_journey?).to eq(false)
    end
    it " should not be able to touch in with a balance less than £1" do
      low_cash_card = Oystercard.new(0)
      expect { low_cash_card.touch_in }.to raise_error "outta cash"
    end
    it "should deduct 1 from the balance on touch out" do
      subject.touch_in
      expect {subject.touch_out}.to change{subject.balance}.by(-1)
    end
  end
end



#my_num = 5
#return my_num.class?
