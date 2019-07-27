require 'rails_helper'

RSpec.describe "metrics/edit", type: :view do
  before(:each) do
    @metric = assign(:metric, Metric.create!())
  end

  it "renders the edit metric form" do
    render

    assert_select "form[action=?][method=?]", metric_path(@metric), "post" do
    end
  end
end
