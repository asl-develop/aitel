# coding: utf-8
module ReserveDecorator
  def display_status
    case status
    when Reserve::STATUS_ASKING then '打診中'
    when Reserve::STATUS_RESERVED then '予約済み'
    when Reserve::STATUS_CHECKED_IN then 'チェックイン済み'
    when Reserve::STATUS_REJECTED then '満席！'
    when Reserve::STATUS_CANCELED then 'キャンセル済み'
    end

  end

  def customers_action_link

    cancel_link = 
      link_to 'キャンセル', cancel_customer_reserve_path( self ),
        method: :put, class: 'btn'
    check_in_link = 
      link_to 'チェックイン', check_in_customer_reserve_path( self ),
        method: :put, class: 'btn'

    case status
    when Reserve::STATUS_ASKING
      cancel_link
    when Reserve::STATUS_RESERVED
      cancel_link +   check_in_link
    when Reserve::STATUS_CHECKED_IN
      ''
    when Reserve::STATUS_REJECTED
      ''
    when Reserve::STATUS_CANCELED
      ''
    end
  end
end
