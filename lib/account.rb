# frozen_string_literal: true

require 'time'
class Account
  attr_reader :balance,
              :transaction_list

  def initialize
    @balance = 0
    @transaction_list = []
  end

  def credit(credit_amount)
    @balance += credit_amount
    @transaction_list.push(credit: credit_amount, date: Time.now.strftime('%d/%m/%Y'), balance: @balance)
  end

  def withdraw(withdraw_amount)
    raise 'You do not have enough funds' if withdraw_amount > @balance
    @balance -= withdraw_amount
    @transaction_list.push(debit: withdraw_amount, date: Time.now.strftime('%d/%m/%Y'), balance: @balance)
  end
end
