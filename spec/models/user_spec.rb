require 'rails_helper'

RSpec.describe Article do
  it 'has a email' do
    user = User.create!(email: 'ceciliadsmachado@gmail.com', password: 'password')
    expect(user.email).to eq('ceciliadsmachado@gmail.com')
  end
end
