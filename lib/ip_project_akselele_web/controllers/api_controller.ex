defmodule IpProjectAkseleleWeb.ApiController do
  use IpProjectAkseleleWeb, :controller
  alias IpProjectAkselele.ApiContext

  def generate(conn, params) do
    key = Randomizer.randomizer(20)
    test = "MyFancyHeader:!"
    mark = "?"
    key2 = Enum.join([test, key, mark])
    user = Guardian.Plug.current_resource(conn)
    code = %{:key => key2, :name => params["api"]["name"]}

    case ApiContext.create_api(code, user) do
      {:ok, api} ->
        conn = put_layout(conn, false)
        show(conn, %{"api_id" => api.id})

      {:error, %Ecto.Changeset{}} ->
        conn
        |> put_flash(
          :info,
          gettext("There has been an error processing your key add. Please try again.")
        )
        |> redirect(to: "/profile")
    end
  end

  def getkeys(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    user_with_loaded_apis = ApiContext.load_apis(user)
    render(conn, "allapis.html", apis: user_with_loaded_apis.apis)
  end

  def delete(conn, %{"api_id" => id}) do
    api = ApiContext.get_api!(id)
    {:ok, _api} = ApiContext.delete_api(api)

    conn
    |> put_flash(:info, gettext("API key deleted successfully."))
    |> redirect(to: Routes.api_path(conn, :getkeys))
  end

  def show(conn, %{"api_id" => id}) do
    

    api = ApiContext.get_api!(id)

    if(api == nil) do
      conn
      |> send_resp(400, gettext("Permission denied"))
    end

    user = Guardian.Plug.current_resource(conn)

    if(user.id == api.user_id) do
      conn = put_layout(conn, false)
      render(conn, "api.html", api: api)
    else
      conn
      |> send_resp(400, gettext("Permission denied"))
    end
  end
end
