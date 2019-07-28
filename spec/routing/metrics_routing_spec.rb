require "rails_helper"

RSpec.describe MetricsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/metrics").to route_to("metrics#index")
    end

    it "routes to #show" do
      expect(:get => "/metrics/1").to route_to("metrics#show", :id => "1")
    end
  end
end
