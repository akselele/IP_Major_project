defmodule IpProjectAkseleleWeb.ErrorHandler do
  import Plug.Conn
  use IpProjectAkseleleWeb, :controller

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
    conn
    |> put_flash(:error, gettext("You are not logged in. Please log in to access the features."))
    |> redirect(to: "/login")
  end
end
