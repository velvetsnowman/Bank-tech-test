# frozen_string_literal: true

require 'time'

class Account
  attr_reader :balance,
              :transaction_list,
              :statement

  def initialize
    @balance = 0
    @transaction_list = []
    @statement = Statement.new
  end

  def deposit(amount)
    raise 'You have to deposit a positive integer' if amount <= 0
    @balance += amount
    @transaction_list.push(credit: format('%.2f', amount), date: Time.now.strftime('%d/%m/%Y'), balance: format('%.2f', @balance))
  end

  def withdraw(amount)
    raise 'You can only withdraw a positive integer' if amount <= 0
    raise 'You do not have enough funds' if amount > @balance
    @balance -= amount
    @transaction_list.push(debit: format('%.2f', amount), date: Time.now.strftime('%d/%m/%Y'), balance: format('%.2f', @balance))
  end

  def print_statement
    @statement.print_statement(@transaction_list)
  end
end
