module ArticlesHelper
  def day_month_year(date_time)
    date_time.strftime('%B, %e,  %Y')
  end
end
