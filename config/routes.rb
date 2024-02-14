Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/insert_photo_record", { :controller => "photos", :action => "create"})

end
