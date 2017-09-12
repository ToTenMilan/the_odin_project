require 'rails_helper'

RSpec.describe FlightsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      @nyc = FactoryGirl.create :airport, code: "NYC"
      @sfa = FactoryGirl.create :airport, code: ""
      @flight1 = FactoryGirl.create :flight, destination_airport: @sfa, departure_airport: @nyc
      @flight2 = FactoryGirl.create :flight, destination_airport: @nyc, departure_airport: @sfa
      # @flights_count = Flight.all.count
      get :index
    end

    # it "returns 2 records from the database" do
    #   # p response
    #   expect(flights_response).to eq 2
    # end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

end


# require 'rails_helper'

# RSpec.describe FlightsController, type: :controller do
#   describe "GET #index" do
#     before(:each) do
#       @flights_count = 4.times { FactoryGirl.create :flight }
#       get :index
#     end



#   end
# end
