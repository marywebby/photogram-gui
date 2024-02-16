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

  def update_user
    the_id = params.fetch("input_username")
    the_user = User.where({ :id => the_id })

    the_user.username = params.fetch("input_username")

    the_user.save
    # !! #<NoMethodError: undefined method `username' for "mary_updated":String>

    next_url = "/users/" + the_id.to_s

    redirect_to(next_url)

    # render({ :template => "user_templates/update"})
  end 
end

