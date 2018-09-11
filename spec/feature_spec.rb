describe 'Feature tests' do

  it 'so a user can store his money, allow a user to deposit' do
    my_account = Account.new
    expect { my_account.deposit(100) }.not_to raise_error
  end

  it 'so a user can use his money, allow a user to withdraw' do
    my_account = Account.new
    my_account.deposit(100)
    expect { my_account.withdraw(100) }.not_to raise_error
  end

  it 'so a user can not have an overdraft, dont allow them to withdraw more than they have' do
    my_account = Account.new
    expect { my_account.withdraw(100) }.to raise_error 'You do not have enough funds'
  end

  it 'so a user can see a list of transactions, allow a user to view his statement' do
    my_account = Account.new
    my_account.deposit(100)
    expect { my_account.print_statement }.not_to raise_error
  end

  it 'so a user can not see an empty statement, dont allow them to view when no transactions' do
    my_account = Account.new
    expect { my_account.print_statement }.to raise_error "There are no transactions"
  end
end
