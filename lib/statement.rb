require_relative 'transaction'

class Statement

  attr_reader :total

  def initialize(account = Transaction.new)
    @total = account.balance
  end

  def print_statement
  end

end
