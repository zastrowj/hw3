Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "index" })

  resources "places"
  resources "entries"
end
