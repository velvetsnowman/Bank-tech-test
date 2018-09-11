# frozen_string_literal: true

require 'statement.rb'
require 'account.rb'

describe Statement do
  let (:statement) { Statement.new(account) }
  let (:account)   { Account.new            }

  it { is_expected.to respond_to(:transaction_list) }
  it { is_expected.to respond_to(:print_statement)  }
  # it { is_expected.to respond_to(:no_transactions)  }

  # it 'should return true if there are no transactions' do
  #   expect(statement.no_transactions).to eq true
  # end

  it 'throws an error if a user attempts to print when no transactions' do
    expect { statement.print_statement }.to raise_error 'There are no transactions'
  end

  it 'should show the list of transactions when instantiated' do
    account.deposit(100)
    expect(statement.transaction_list).to include(credit: '100.00', date: Time.now.strftime('%d/%m/%Y'), balance: '100.00')
  end

  specify do
    account.deposit(100)
    allow(Time).to receive(:now).and_return('11/09/2018')
    expect { statement.print_statement }.to output(
      "Date || Credit || Debit || Balance\n" + "11/09/2018 || 100.00 ||  || 100.00 \n"
                                                   ).to_stdout
  end
end
