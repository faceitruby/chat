class PersonsController < ApplicationController
  def profile
    @user = current_user
  end
  def search_contacts
    return head 422 if params['search'].blank?

    # gets finded as [ ['first_name1', 'last_name1'], ['first_name2', 'last_name2'] ]
    finded = User.where('lower(first_name) LIKE :search or lower(last_name) LIKE :search',
                          search: "%#{params['search'].downcase}%")
                 .pluck(:first_name, :last_name)
    finded.map! { |arr| arr.join(' ') }
    render json: { found_users: finded, search: params['search'] }
  end
end
