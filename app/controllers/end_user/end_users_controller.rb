class EndUser::EndUsersController < ApplicationController
    def confirm
    end
    
    def withdraw
        @end_user = EndUser.find(params[:id])
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @end_user.update(is_valid: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
end
