# coding: utf-8
module AnswerDecorator

  def display_status
    case status
    when Answer::STATUS_WAITING then "未回答"
    when Answer::STATUS_OK then "OKです！"
    when Answer::STATUS_NG then "NGです！"
    end
  end
end
