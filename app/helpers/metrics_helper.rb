module MetricsHelper
  def show_row(user)
    value = @metric.user_value_hash[user.id]
    row = []
    row << full_name(user)
    row << content_tag(:td, user.email)
    row << value_td(value)
    row << edit_link(value, user)
    safe_join(row)
  end

  def value_td(value)
    content_tag(:td, value.nil? ? 0 : value.value)
  end

  def edit_link(value, user)
    content_tag(:td) do 
      if value.nil?
        link_to('Edit', new_metric_value_path(metric_id: @metric.id, user_id: user.id))
      else
        link_to('Edit', edit_metric_value_path(metric_id: @metric.id, id: value.id, user_id: user.id))
      end
    end
  end

  def full_name(user)
    content_tag(:td, "#{user.first_name} #{user.last_name}")
  end
end
