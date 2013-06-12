# coding: utf-8
module ReserveDecorator
  def display_status
    case status
    when Reserve::STATUS_ASKING then '予約確認待ち'
    when Reserve::STATUS_RESERVED then '予約済み'
    when Reserve::STATUS_CHECKED_IN then 'チェックイン済み'
    when Reserve::STATUS_REJECTED then '満席のため予約不可'
    when Reserve::STATUS_CANCELED then 'キャンセル済み'
    end

  end

  def check_in_link

    if Time.now >= expected_time
      link_to 'チェックイン', check_in_customer_reserve_path( self ),
        method: :put, class: 'btn', confirm: 'チェックインしますか？'
    else
      link_to 'チェックイン', '#', class: 'btn', disabled: true
    end
  end

  def customers_action_link

    cancel_link = 
      link_to 'キャンセル', cancel_customer_reserve_path( self ),
        method: :put, class: 'btn', confirm: '予約をキャンセルしますか？'

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

  def shops_action_link

    accept_link = 
      link_to '予約確定', accept_reserve_path( self ),
        method: :put, class: 'btn'
    reject_link = 
      link_to '満席のため予約不可', reject_reserve_path( self ),
        method: :put, class: 'btn'

    if status == Reserve::STATUS_ASKING
      accept_link + reject_link
    end
  end

end
