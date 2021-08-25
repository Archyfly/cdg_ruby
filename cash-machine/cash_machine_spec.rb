require './cash_machine.rb'

RSpec.describe CashMachine do
  subject { CashMachine.new(balance) }

  describe "#deposit" do
    let(:balance) { 28 }
    let(:value) { 10 }

    it "increases balance" do
      cashed_balance = subject.balance
      puts cashed_balance
      subject.deposit(value)
      puts subject.balance
      expect(subject.balance).to eq cashed_balance + value
    end

    context "#when value is less then zero" do
      let(:value) { -150 }

      it "#raises exception" do
        expect { subject.deposit(value) }.to raise_error 'Please input correct amount > 0'
      end
    end
  end
  
  describe "#withdraw" do
    let(:balance) { 51 }
    let(:value) { 21 }

    it "decreases balance" do
      cashed_balance = subject.balance
      subject.withdraw(value)
      expect(subject.balance).to eq cashed_balance - value
    end

    context "#when value more then deposit" do
      let(:value) { 80 }

      it "#raises exception" do
        expect { subject.withdraw(value) }.to raise_error 'Amount of withdraw exceeds current balance!'
      end
    end

  end
end