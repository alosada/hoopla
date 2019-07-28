require 'rails_helper'

RSpec.describe "metrics/show", type: :view do
  before(:each) do
    @metric = Metric.all.first
    @users = User.all
  end

  it "renders attributes in <p>" do
    render
  end
end
