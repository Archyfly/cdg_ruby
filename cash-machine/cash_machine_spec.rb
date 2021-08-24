require './cash_machine.rb'

RSpec.describe CashMachine do
  subject { CashMachine.new }

  describe "#deposit" do
    let(:balance) { 100 }
    let(:value) { 10 }

    it "increases balance" do
      cashed_balance = subject.balance
      subject.deposit(value)
      expect(subject.balance).to eq cashed_balance + value
    end
  end

  describe "#withdraw" do
    let(:balance) { 70 }
    let(:value) { 21 }

    it "decreases balance" do
      cashed_balance = subject.balance
      subject.withdraw(value)
      expect(subject.balance).to eq cashed_balance - value
    end
  end
end