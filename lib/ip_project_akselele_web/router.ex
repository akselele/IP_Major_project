defmodule IpProjectAkseleleWeb.Router do
  use IpProjectAkseleleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug IpProjectAkseleleWeb.Plugs.Locale
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

    pipeline :allowed_for_users do
    plug IpProjectAkseleleWeb.Plugs.AuthorizationPlug, ["Admin", "User"]
  end

  pipeline :allowed_for_admins do
    plug IpProjectAkseleleWeb.Plugs.AuthorizationPlug, ["Admin"]
  end

# for non users
  scope "/", IpProjectAkseleleWeb do
    pipe_through [:browser, :auth]

    get "/signup", SessionController, :showSignup
    post "/signup", SessionController, :signup
    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end


# for users
  scope "/", IpProjectAkseleleWeb do
    pipe_through [:browser, :auth, :ensure_auth, :allowed_for_users]

    get "/", PageController, :dashboard
    get "/dashboard", PageController, :dashboard
    scope "/profile" do
      get "/", ProfileController, :showProfile
      post "/api", ApiController, :generate
      get "/api", ApiController, :getkeys
      get "/api/:api_id", ApiController, :show
      delete "/api/:api_id", ApiController, :delete
      scope "/edit" do
        get "/username", ProfileController, :showChangeusername
        put "/username", ProfileController, :changeUsername
        get "/password", ProfileController, :showChangepassword
        put "/password", ProfileController, :changePassword
      end
  end
  end

# for admins
  scope "/admin", IpProjectAkseleleWeb do
    pipe_through [:browser, :auth, :ensure_auth, :allowed_for_admins]

    resources "/users", UserController
    get "/", PageController, :admin_index
  end

  scope "/admin", IpProjectAkseleleWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/users", UserController
  end

# api
  scope "/api", IpProjectAkseleleWeb do
    pipe_through :api

    resources "/users", UserController, only: [] do
      resources "/pets", PetController
    end
  end

  pipeline :auth do
    plug IpProjectAkseleleWeb.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  # Other scopes may use custom stacks.
  # scope "/api", IpProjectAkseleleWeb do
  #   pipe_through :api
  # end
end
