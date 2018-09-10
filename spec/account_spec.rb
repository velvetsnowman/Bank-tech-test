# frozen_string_literal: true

require 'account'
require 'time'

describe Account do
  let (:account) { Account.new }

  it { is_expected.to respond_to(:balance)                   }
  it { is_expected.to respond_to(:transaction_list)          }
  it { is_expected.to respond_to(:credit).with(1).argument   }
  it { is_expected.to respond_to(:withdraw).with(1).argument }

  it 'when a user opens an account, it should be initialized with a balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'when a user opens an account, it should have an empty list of transactions' do
    expect(account.transaction_list.empty?).to be true
  end

  describe '#credit' do
    it 'should increase my balance when I deposit money' do
      account.credit(100)
      expect(account.balance).to eq 100
    end

    it 'should store the transaction into an array' do
      account.credit(100)
      expect(account.transaction_list.empty?).to be false
    end

    it 'should store the transaction, nicely formated, into an array' do
      account.credit(100)
      expect(account.transaction_list).to include(Credit: 100, Date: Time.now.strftime('%d/%m/%Y'), Balance: 100)
    end
  end

  describe '#withdraw' do
    it 'shoud throw an error if I try to withdraw more than my balance' do
      account.credit(100)
      expect { account.withdraw(150) }.to raise_error 'You do not have enough funds'
    end

    it 'should decrease my balance when I withdraw money' do
      account.credit(100)
      account.withdraw(50)
      expect(account.balance).to eq 50
    end

    it 'should store the transaction, nicely formated, into an array' do
      account.credit(100)
      account.withdraw(50)
      expect(account.transaction_list).to include(Debit: 50, Date: Time.now.strftime('%d/%m/%Y'), Balance: 50)
    end
  end
end
