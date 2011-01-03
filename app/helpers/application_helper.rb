module ApplicationHelper
  def date_tokyo(date)
    date.strftime("%Y年 %m月 %d日 (%X)")
  end
end
