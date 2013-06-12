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
end
