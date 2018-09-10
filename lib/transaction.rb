class Transaction

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def credit_account(credit_amount)
    @credit_amount = credit_amount ##might not need
    @balance += credit_amount
  end

end
