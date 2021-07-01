defmodule IpProjectAkseleleWeb.Plugs.AuthorizationPlug do
  import Plug.Conn
  alias IpProjectAkselele.UserContext.User
  alias Phoenix.Controller
  use IpProjectAkseleleWeb, :controller

  def init(options), do: options

  def call(%{private: %{guardian_default_resource: %User{} = u}} = conn, roles) do
    conn
    |> grant_access(u.role in roles)
  end

  def grant_access(conn, true), do: conn

  def grant_access(conn, false) do
    conn
    |> Controller.put_flash(:error, gettext("You do not have access to these features."))
    |> Controller.redirect(to: "/")
    |> halt
  end
end