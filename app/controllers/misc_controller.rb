class MiscController < ApplicationController
  def homepage
    render({ :template => "user_templates/index"})
  end
end
