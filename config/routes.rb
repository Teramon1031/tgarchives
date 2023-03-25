# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "home#top"
  get "admin/list" => "admin#list"
  get "admin/new" => "admin#new"
  post "admin/update/:id" => "admin#update"
  get "admin/edit/:id" => "admin#edit"

  get "/" => "home#top"
  get "/:id" => "team_page#each"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
