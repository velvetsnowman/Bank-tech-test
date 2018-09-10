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
    raise 'You have to credit a positive integer' if amount <= 0
    @balance += amount
    @transaction_list.push(credit: format('%.2f', amount), date: Time.now.strftime('%d/%m/%Y'), balance: format('%.2f', @balance))
  end

  def withdraw(amount)
    raise 'You can only withdraw a positive integer' if amount <= 0
    raise 'You do not have enough funds' if amount > @balance
    @balance -= amount
    @transaction_list.push(debit: format('%.2f', amount), date: Time.now.strftime('%d/%m/%Y'), balance: format('%.2f', @balance))
  end
end
