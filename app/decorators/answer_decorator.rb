# coding: utf-8
module AnswerDecorator

  def display_status
    case status
    when 0 then "未回答"
    when 1 then "OKです！"
    when 2 then "NGです！"
    end
  end
end
