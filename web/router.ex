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

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api", ContaComigo.Api do
    pipe_through :api

    resources "/products", ProductController, except: [:new, :edit]
    resources "/customers", CustomerController, except: [:new, :edit]
    resources "/orders", OrderController, except: [:new, :edit]
    resources "/addresses", AddressController, except: [:new, :edit]
    resources "/line_items", LineItemController, except: [:new, :edit]
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/", ExAdmin do
    pipe_through :protected
    admin_routes()
  end
end
