class MetricsController < ApplicationController
  before_action :set_metric, only: [:show]

  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = Metric.all
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
    @users = User.all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_metric
    @metric = Metric.find(params[:id])
  end
end
