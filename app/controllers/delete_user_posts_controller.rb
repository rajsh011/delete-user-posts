class DeleteUserPostsController < ApplicationController
    before_action :ensure_admin
  
    def delete_all_posts
      username = params[:username]
      user = User.find_by_username_or_email(username)
  
      if user
        PostDestroyer.new(current_user).destroy_all_posts(user)
        redirect_to admin_index_path, notice: "All posts by #{username} have been deleted."
      else
        redirect_to admin_index_path, alert: "User not found."
      end
    end
  end
  