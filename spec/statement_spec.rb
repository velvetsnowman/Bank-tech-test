# frozen_string_literal: true

require 'statement.rb'
require 'account.rb'

describe Statement do
  let (:statement) { Statement.new(account) }
  let (:account)   { Account.new            }

  it { is_expected.to respond_to(:total)            }
  it { is_expected.to respond_to(:transaction_list) }
  it { is_expected.to respond_to(:print_statement)  }

  it 'should show the total balance when intantiated' do
    account.credit(100)
    expect(statement.total).to eq 100
  end

  it 'should show the list of transactions when intantiated' do
    account.credit(100)
    expect(statement.transaction_list).to include(Credit: '100', Date: Time.now.strftime('%d/%m/%Y').to_s)
  end
end
