Rails.application.routes.draw do
# This create action is setup by knock we get it through the inheritance from the auth_token_controller
 post "/login", to: "user_token#create"
end
