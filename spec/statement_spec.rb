require 'statement.rb'
require 'account.rb'

describe Statement do
  let (:statement) { Statement.new(account) }
  let (:account) { Account.new }
  it { is_expected.to respond_to(:print_statement) }

  it 'should show the total balance when intantiated' do
    account.credit(100)
    expect(statement.total).to eq 100
  end

end
