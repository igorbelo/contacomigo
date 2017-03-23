defmodule ContaComigo.Router do
  use ContaComigo.Web, :router
  use Coherence.Router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/", ExAdmin do
    pipe_through :browser # Use the default browser stack
    admin_routes()
  end

  # Other scopes may use custom stacks.
  # scope "/api", ContaComigo do
  #   pipe_through :api
  # end
end
