class ValuesController < ApplicationController
  before_action :set_metric
  before_action :set_user
  def new
    @value = Value.new
  end

  def create
    data = {
      'owner' => {
        'kind'=> 'user',
        'href' => "https://api.hoopla.net/users/#{params[:user_id]}"
        },
      'value' => params[:value].to_f
    }
    if Value.create(@metric.href, data)
      flash[:notice] = 'Value updated successfully'
    else
      flash[:alert] = 'There was a problem updatig this value'
    end
    redirect_to metric_path(@metric.id)
  end

  def edit
    @value = Value.find(params[:id],params[:metric_id])
  end

  def update
    @value = Value.find(params[:id],params[:metric_id])
    if @value.update_attributes({'value' => params[:value].to_f})
      flash[:notice] = 'Value updated successfully'
    else
      flash[:alert] = 'There was a problem updatig this value'
    end
    redirect_to metric_path(@metric.id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_metric
    @metric = Metric.find(params[:metric_id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end