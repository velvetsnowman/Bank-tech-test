# frozen_string_literal: true

require_relative 'account'

class Statement

  def print_statement(transaction_list)
    raise 'There are no transactions' if transaction_list.empty?
    puts 'Date || Credit || Debit || Balance'
    transaction_list.reverse_each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]} "
    end
  end

end
