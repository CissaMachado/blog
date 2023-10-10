require 'rails_helper'

RSpec.describe User do
  it 'has a email' do
    user = User.create!(email: 'ceciliadsmachado@gmail.com', password: 'password')
    expect(user.password).to eq('password')
  end
end
