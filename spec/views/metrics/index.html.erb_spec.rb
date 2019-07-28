require 'rails_helper'

RSpec.describe "metrics/index", type: :view do
  before(:each) do
    @metrics = Metric.all
  end

  it "renders a list of metrics" do
    render
  end
end
