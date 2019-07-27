require 'rails_helper'

RSpec.describe "metrics/new", type: :view do
  before(:each) do
    assign(:metric, Metric.new())
  end

  it "renders new metric form" do
    render

    assert_select "form[action=?][method=?]", metrics_path, "post" do
    end
  end
end
