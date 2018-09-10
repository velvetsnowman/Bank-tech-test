# frozen_string_literal: true

require 'time'
class Account
  attr_reader :balance,
              :transaction_list

  def initialize
    @balance = 0
    @transaction_list = []
  end

  def credit(amount)
    @balance += amount
    @transaction_list.push(credit: amount, date: Time.now.strftime('%d/%m/%Y'), balance: @balance)
  end

  def withdraw(amount)
    raise 'You do not have enough funds' if amount > @balance
    @balance -= amount
    @transaction_list.push(debit: amount, date: Time.now.strftime('%d/%m/%Y'), balance: @balance)
  end
end
