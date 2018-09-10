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
    @transaction_list.push({Credit: "#{credit_amount}", Date: "#{Time.now.strftime("%d/%m/%Y")}"})
  end

  def withdraw(withdraw_amount)
    fail "You do not have enough funds" if withdraw_amount > @balance
    @transaction_list.push(Debit: "#{withdraw_amount}", Date: "#{Time.now.strftime("%d/%m/%Y")}")
    @balance -= withdraw_amount
  end

end
