# frozen_string_literal: true

require_relative 'account'

class Statement
  attr_reader :total,
              :transaction_list

  def initialize(account = Account.new)
    @transaction_list = account.transaction_list
  end

  def print_statement
    raise 'There are no transactions' if no_transactions
    puts 'Date || Credit || Debit || Balance'
    @transaction_list.reverse_each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]} "
    end
  end

  private
  def no_transactions
    @transaction_list.empty?
  end

end
