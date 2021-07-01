defmodule IpProjectAkseleleWeb.PageController do
  use IpProjectAkseleleWeb, :controller
  alias IpProjectAkselele.PetContext

  def getUser(conn) do
    case Guardian.Plug.current_resource(conn) do
      user = u -> {:ok, u}
      nil -> {:error, :resource_not_found}
    end
  end

  def index(conn, _params) do
    render(conn, "index.html", role: "everyone")
  end

  def user_index(conn, _params) do
    render(conn, "index.html", role: "users")
  end

  def admin_index(conn, _params) do
    render(conn, "index.html", role: "admins")
  end

  def dashboard(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    user_with_loaded_pets = PetContext.load_pets(user)
    render(conn, "dashboard.html", pets: user_with_loaded_pets.pets)
  end
end
