Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/add_user", { :controller => "users", :action => "add_user"})

  get("/update_user", { :controller => "users", :action => "update_user"})

  

  get("/photos", { :controller => "photos", :action => "index"})

  get("/photos/:path_id", { :controller => "photos", :action => "show"})

  get("delete_photo/:delete_id", { :controller => "photos", :action => "delete" })

  get("/insert_photo", { :controller => "photos", :action => "create"})

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

  post("/add_comment", { :controller => "photos", :action => "create_comment"})
end
