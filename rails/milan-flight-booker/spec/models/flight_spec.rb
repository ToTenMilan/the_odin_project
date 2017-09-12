require 'rails_helper'

RSpec.describe Flight, type: :model do
  let(:flight) { FactoryGirl.build :flight }
  subject { flight }

  it { should respond_to :start }
  it { should respond_to :duration }
  it { should respond_to :destination_airport_id }
  it { should respond_to :departure_airport_id }
end
