require './cash_machine.rb'

RSpec.describe CashMachine do
  subject { CashMachine.new(100) }

  describe "#deposit" do
    let(:value) { 10 }

    it "increases balance" do
      cashed_balance = subject.balance
      puts cashed_balance
      subject.deposit(value)
      puts subject.balance
      expect(subject.balance).to eq cashed_balance + value
    end
  end
  
  describe "#withdraw" do
    let(:value) { 21 }

    it "decreases balance" do
      cashed_balance = subject.balance
      subject.withdraw(value)
      expect(subject.balance).to eq cashed_balance - value
    end
  end
end