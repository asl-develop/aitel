#coding: utf-8
module ApplicationHelper
  def mmddhhmm( datetime )
    return '' if datetime.nil?
    datetime.strftime("%m/%d %H:%M")
  end
  def mmddhhmm_ja( datetime )
    return '' if datetime.nil?
    datetime.strftime("%m月%d日 %H時%M分")
  end
  def number_selector_options( min, max )
    return (min.to_s..max.to_s)
  end
  def datetime_select_ex( model, attr ) 
    datetime_select_jp model, attr, {
      start_year:         Date.today.year,
      end_year:           Date.today.year + 1,
      use_month_numbers:  true,
      minute_step: 15,
      default: (Time.now + 15.minutes).floor(15.minutes)
    },{class: "want date-selector"}
  end
  def datetime_select_jp(object_name, method, options={ } ,html_options={ })
    options[:use_month_numbers] = true unless options[:use_month_numbers]
    t = datetime_select(object_name, method, options, html_options)
      t.sub!(/<\/select>(.+?)<\/select>(.+?)<\/select>(.+?)<\/select>(.+?)<\/select>/m,
        "</select>年\\1</select>月\\2</select>日<br />\\3</select>時\\4</select>分")
    t.gsub('&mdash;','').gsub(':','').html_safe
  end
end
