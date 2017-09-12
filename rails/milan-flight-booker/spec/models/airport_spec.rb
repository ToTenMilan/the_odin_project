require 'rails_helper'

RSpec.describe Airport, type: :model do
  let(:airport) { FactoryGirl.build :airport }
  subject { airport }

  it { should respond_to :code }
  it { should respond_to :arriving_flights }
  it { should respond_to :departing_flights }
end
