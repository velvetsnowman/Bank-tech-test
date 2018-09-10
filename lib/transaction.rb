class Transaction

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit(credit_amount)
    @credit_amount = credit_amount ##might not need
    @balance += credit_amount
  end

  def withdraw(withdraw_amount)
    fail "You do not have enough funds" if withdraw_amount > @balance 
    @withdraw_amount = withdraw_amount ##might not need
    @balance -= withdraw_amount
  end

end
