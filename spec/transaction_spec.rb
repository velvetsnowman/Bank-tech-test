require 'transaction'

describe Transaction do

  let (:account) { Transaction.new }

  it { is_expected.to respond_to(:credit_account).with(1).argument }

  it 'when a user opens an account, it should be initialized with a balance of 0' do
    expect(account.balance).to eq 0
  end
end
