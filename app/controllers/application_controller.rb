class ApplicationController < ActionController::Base
  # use fail to dump params hash to the browser
  protect_from_forgery with: :exception

  # test hello as root to make sure Heroku deployment is successful
  # def hello
    # render html: "Hello, world"
  # end
end
