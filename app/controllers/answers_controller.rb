# coding: utf-8

class AnswersController < ShopBase
  
  def index
    @answers = Answer.includes(:want, :want => :user).by(@current_shop).waiting
  end
  
  def consent
    @answer = Answer.find(params[:id])
    @answer.status = Answer::STATUS_OK

# TODO 楽観的ロック必要 
    if @answer.save
      redirect_to controller: :answers, action: :index, notice: "OKで返事しました。"
    else
      redirect_to controller: :answers, action: :index
    end
    
  end
  
  def reject
    @answer = Answer.find(params[:id])
    @answer.status = Answer::STATUS_NG

# TODO 楽観的ロック必要 
    if @answer.save
      redirect_to controller: :answers, action: :index, notice: "NGで返事しました。"
    else
      redirect_to controller: :answers, action: :index
    end
    
  end
end
