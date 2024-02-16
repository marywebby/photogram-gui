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

  def add_user
    input_username = params.fetch("input_username")

    new_user = User.new
    new_user.username = input_username

    new_user.save

    # render({ :template => "photo_templates/create"})

    next_url = "/users/" + input_username.to_s

    redirect_to(next_url)

  end

  def update
    the_id = params.fetch("the_id")

    matching_user = User.where({ :id => the_id }).first

    matching_user.username = params.fetch("input_username")

    matching_user.save
    # matching_user.update(username: params.fetch("input_username"))

    next_url = "/users/" + matching_user.username

    redirect_to(next_url)

    # render({ :template => "user_templates/update"})
  end 
end
