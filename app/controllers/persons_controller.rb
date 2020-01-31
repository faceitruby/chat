class PersonsController < ApplicationController
  def profile
    @user = current_user
  end

  def search_contacts
    return head 422 if params['search'].blank?

    # gets finded as [ ['first_name1', 'last_name1'], ['first_name2', 'last_name2'] ]
    found = User.where('lower(first_name) LIKE :search or lower(last_name) LIKE :search',
                          search: "%#{params['search'].downcase}%")
                 .pluck(:id, :first_name, :last_name)
    found.map! { |arr| arr.join(' ') }
    render json: { found: found, search: params['search'] }
  end

  def search_chats
    return head 422 if params['search'].blank?

    found = ChatRoom.where('lower(title) LIKE :search and chat_type = :type',
                           search: "%#{params['search'].downcase}%", type: true)
                    .pluck(:id, :title)
    found.map! { |arr| arr.join(' ') }
    render json: { found: found, search: params['search'] }
  end
end
