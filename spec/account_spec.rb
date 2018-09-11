# frozen_string_literal: true

require 'account'
require 'time'

describe Account do
  let (:account) { Account.new }

  it { is_expected.to respond_to(:balance)                   }
  it { is_expected.to respond_to(:transaction_list)          }
  it { is_expected.to respond_to(:deposit).with(1).argument  }
  it { is_expected.to respond_to(:withdraw).with(1).argument }

  it 'when a user opens an account, it should have a default balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'when a user opens an account, it should have an empty list of transactions' do
    expect(account.transaction_list.empty?).to be true
  end

  describe '#depsit' do
    it 'shoud throw an error if a user tries to deposit a negative integer' do
      expect { account.deposit(0) }.to raise_error 'You have to deposit a positive integer'
    end

    it 'should increase my balance when I deposit money' do
      account.deposit(100)
      expect(account.balance).to eq 100
    end

    it 'should store the transaction into an array' do
      account.deposit(100)
      expect(account.transaction_list).to include(credit: '100.00', date: Time.now.strftime('%d/%m/%Y'), balance: '100.00')
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
      expect(account.transaction_list).to include(debit: '0.01', date: Time.now.strftime('%d/%m/%Y'), balance: '99.99')
    end
  end
end
