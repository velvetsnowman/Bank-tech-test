# frozen_string_literal: true

require 'account'
require 'time'

describe Account do
  let (:account)   { Account.new                }
  let (:statement) { double :statement_instance }

  it 'when a user opens an account, it should have a default balance of 0' do
    expect(account.balance).to eq 0
  end

  describe '#deposit' do
    it 'shoud throw an error if a user tries to deposit a negative integer' do
      expect { account.deposit(0) }.to raise_error 'You have to deposit a positive integer'
    end

    it 'should increase my balance when I deposit money' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end

    it 'should store the transaction into an array' do
      account.deposit(100)
      allow(Time).to receive(:now).and_return('11/09/2018')
      expect(account.transaction_list).to include(credit: '100.00', date: '11/09/2018', balance: '100.00')
    end
  end

  describe '#withdraw' do
    before(:each) do
      account.deposit(100)
    end

    it 'shoud throw an error if I try to withdraw more than my balance' do
      expect { account.withdraw(150) }.to raise_error 'You do not have enough funds'
    end

    it 'shoud throw an error if I try to withdraw more than my balance' do
      expect { account.withdraw(0) }.to raise_error 'You can only withdraw a positive integer'
    end

    it 'should decrease my balance when I withdraw money' do
      account.withdraw(50)
      expect(account.balance).to eq 50
    end

    it 'should store the transaction, nicely formated, into an array' do
      account.withdraw(0.01)
      allow(Time).to receive(:now).and_return('11/09/2018')
      expect(account.transaction_list).to include(debit: '0.01', date: '11/09/2018', balance: '99.99')
    end
  end

  describe '#print_statement' do
    it 'delegates to the statement object' do
      expect(account.statement).to receive(:print_statement).with(account.transaction_list)
      account.print_statement
    end
  end
end
