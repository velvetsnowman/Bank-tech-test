# frozen_string_literal: true

require 'statement.rb'
require 'account.rb'

describe Statement do
  let (:statement) { Statement.new }
  let (:account)   { Account.new   }

  it 'throws an error if a user attempts to print when no transactions' do
    expect { statement.print_statement(account.transaction_list) }.to raise_error 'There are no transactions'
  end

  specify do
    account.deposit(100)
    allow(Time).to receive(:now).and_return('11/09/2018')
    expect { statement.print_statement(account.transaction_list) }.to output(
      "Date || Credit || Debit || Balance\n" + "11/09/2018 || 100.00 ||  || 100.00 \n"
                                                                             ).to_stdout
  end
end
