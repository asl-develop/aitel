#coding: utf-8
class MessagesController < ShopBase

  def new 
    @message = Message.new
    @vips = @current_shop.vips.includes(:user)
  end

  def create
    puts params

    to_users = params[:to_users] || []
    to_users.map(&:to_i).each do |to_user|
      message = Message.new( params[:message] )
      message.shop_id = @current_shop.id
      message.user_id = to_user
      message.save!
    end
    
    redirect_to new_message_path, notice: 'メッセージを送信しました'


  end

end
