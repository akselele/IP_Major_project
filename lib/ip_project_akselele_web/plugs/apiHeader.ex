defmodule IpProjectAkseleleWeb.Plugs.ApiHeader do
  import Plug.Conn
  alias IpProjectAkselele.ApiContext.Api
  alias IpProjectAkselele.ApiContext
  alias IpProjectAkselele.UserContext
  alias Phoenix.Controller
  require Logger

  def isCorrect(conn, userid) do
    key2 = Enum.at(get_req_header(conn, "key"), 0)
    name2 = Enum.at(get_req_header(conn, "name"), 0)

    user = UserContext.get_user!(userid)
    apis = ApiContext.load_apis(user)
    apisList = Map.get(apis, :apis)

    a = 0

    a =
      Enum.reduce(apisList, 0, fn x, acc ->
        if(x.name == name2 && x.key == key2) do
          Logger.debug("truuuu")
          acc + 1
        else
        Logger.debug("heyyy")
          acc
        end
      end)

    Logger.debug(inspect(a))

    if a > 0 do
      true
    else
      Logger.debug("faaaaaaaaalse")
      false
    end

    # if is_nil(name2) do
    #   false
    # else
    #   case ApiContext.get_api_by_name(name2) do
    #     nil ->
    #       false

    #     api ->
    #       case ApiContext.get_api_by_user_id(userid) do
    #         nil ->
    #           false

    #         api ->
    #           if api.key === key2 do
    #             true
    #           else
    #             false
    #           end
    #       end
    #   end
    # end
  end
end
