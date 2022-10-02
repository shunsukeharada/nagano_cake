class EndUser::EndUsersController < ApplicationController
    def show
        end_user = current_end_user
        @first_name = end_user.first_name
        @last_name = end_user.last_name
        @kana_first_name = end_user.kana_first_name
        @kana_last_name = end_user.kana_last_name
        @postal_code = end_user.postal_code
        @address = end_user.address
        @phone_number = end_user.phone_number
        @email = end_user.email
    end
    
    def confirm
    end
    
    def withdraw
        @end_user = current_end_user
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @end_user.update(is_valid: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
end
