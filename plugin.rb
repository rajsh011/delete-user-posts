# name: delete-user-posts
# about: A plugin to delete all posts of a user
# version: 0.1
# authors: YourName
# url: OptionalURL

enabled_site_setting :delete_user_posts_enabled

# register_asset 'register_asset 'stylesheets/delete-user-posts.scss''

after_initialize do
  load File.expand_path('../app/controllers/delete_user_posts_controller.rb', __FILE__)
  Discourse::Application.routes.append do
    get '/admin/plugins/delete-user-posts' => 'admin/plugins#index'
    delete '/admin/plugins/delete-user-posts/:username' => 'delete_user_posts#delete_all_posts'
  end
end
