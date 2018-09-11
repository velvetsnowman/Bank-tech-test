# frozen_string_literal: true

require 'statement.rb'
require 'account.rb'

describe Statement do
  let (:statement) { Statement.new(account) }
  let (:account)   { Account.new            }

  it { is_expected.to respond_to(:transaction_list) }
  it { is_expected.to respond_to(:print_statement)  }

  it 'shoud throw an error if a user attempts to print a statement with no transactions' do
    expect { statement.print_statement }.to raise_error 'There are no transactions'
  end

  it 'should show the list of transactions when instantiated' do
    account.deposit(100.00)
    expect(statement.transaction_list).to include(credit: '100.00', date: Time.now.strftime('%d/%m/%Y'), balance: '100.00')
  end

  specify do
    account.deposit(100.00)
    expect { statement.print_statement }.to output(
      "Date || Credit || Debit || Balance\n" + "#{Time.now.strftime('%d/%m/%Y')} || 100.00 ||  || 100.00 \n"
    ).to_stdout
  end
end
