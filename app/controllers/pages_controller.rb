class PagesController < ApplicationController
  def home
  end

  def about
  	@title = 'About |'
  end

  def services
  	@title = 'Services |'
  end

  def contact_us
  	@title = 'Contact |'
    
    @fullname = params["fullname"]
    @email = params["email"]
    @text = params["text"]
    @submitted = params["commit"]
  end
end
