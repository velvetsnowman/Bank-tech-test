# frozen_string_literal: true

require_relative 'account'

class Statement
  attr_reader :total,
              :transaction_list

  def initialize(account = Account.new)
    @total = account.balance
    @transaction_list = account.transaction_list
  end

  def print_statement
    puts 'Date || Credit || Debit || Balance'
    @transaction_list.reverse_each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]} "
    end
  end
end
