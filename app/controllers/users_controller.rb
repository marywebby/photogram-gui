class UsersController < ApplicationController 
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index"})
  end 

  def show 
    input_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => input_username })

    @the_user = matching_usernames.first

    if @the_user == nil
      redirect_to("/users", status: 404)
    else 
      render({ :template => "user_templates/show"})
    end 
  end 
end