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
    @transaction_list.push(Credit: credit_amount.to_s, Date: Time.now.strftime('%d/%m/%Y').to_s)
  end

  def withdraw(withdraw_amount)
    raise 'You do not have enough funds' if withdraw_amount > @balance
    @transaction_list.push(Debit: withdraw_amount.to_s, Date: Time.now.strftime('%d/%m/%Y').to_s)
    @balance -= withdraw_amount
  end
end
