class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # test hello as root to make sure Heroku deployment is successful
  # def hello
    # render html: "Hello, world"
  # end
end
