class PhotosController < ApplicationController
  def index 
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index"})
  end 

  def show
    url_id  = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.first

    # next_url = "/photos/" + the_photo.id.to_s

    # redirect_to(next_url)

    render({ :template => "photo_templates/show"})
  end 

  def delete
    the_id = params.fetch("delete_id")

    matching_photos = Photo.where({ :id => the_id}) 

    the_photo = matching_photos.first 

    the_photo.destroy

    # render({ :template => "photo_templates/delete" })

    redirect_to("/photos")
  end

  def create 
    input_image = params.fetch("photo_image")
    input_caption = params.fetch("photo_caption")
    input_owner_id = params.fetch("photo_user_id")

    a_new_photo = Photo.new
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/create"})

    next_url = "/photos/" + a_new_photo.id.to_s

    redirect_to(next_url)
  end

  def update
    the_id = params.fetch("modify_id")
 
    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.first

    input_image = params.fetch("photo_image")
    input_caption = params.fetch("photo_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    # render({ :template => "photo_templates/update" })

    next_url = "/photos/" + the_photo.id.to_s

    redirect_to(next_url)
  end

  def create_comment
    input_photo_id = params.fetch("input_photo_id")
    input_author_id = params.fetch("input_author_id")
    input_comment = params.fetch("input_comment")

    a_new_comment = Comment.new
    a_new_comment.photo_id = input_photo_id
    a_new_comment.author_id = input_author_id
    a_new_comment.body = input_comment

    a_new_comment.save

    # @the_photo = Photo.where({ :id => input_photo_id })

    next_url = "/photos/" + input_photo_id.to_s

    redirect_to(next_url)

    # redirect_to("/photos/#{input_photo_id}")
  end
end 
