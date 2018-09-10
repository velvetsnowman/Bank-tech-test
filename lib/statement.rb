require_relative 'account'

class Statement

  attr_reader :total

  def initialize(account = Account.new)
    @total = account.balance
  end

  def print_statement
  end

end
