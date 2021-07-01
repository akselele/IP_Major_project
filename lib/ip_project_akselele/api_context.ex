defmodule IpProjectAkselele.ApiContext do
  import Ecto.Query, warn: false
  alias IpProjectAkselele.Repo
  require Logger
  alias IpProjectAkselele.ApiContext.Api
  alias IpProjectAkselele.UserContext.User

  def load_apis(%User{} = u), do: u |> Repo.preload([:apis])

  def list_apis do
    Repo.all(Api)
  end

  def get_api!(id), do: Repo.get!(Api, id)

  def get_api_by_user_id(user) do
    case Repo.get_by(Api, user_id: user) do
      api ->
        api

      nil ->
        nil
    end
  end

  def load_apis(%User{} = u), do: u |> Repo.preload([:apis])

  def get_api_by_name(name) do
    case Repo.get_by(Api, name: name) do
      api ->
        api

      nil ->
        nil
    end
  end

  def create_api(attrs, %User{} = user) do
    %Api{}
    |> Api.create_changeset(attrs, user)
    |> Repo.insert()
  end

  def update_api(%Api{} = api, attrs) do
    api
    |> Api.changeset(attrs)
    |> Repo.update()
  end

  def delete_api(%Api{} = api) do
    Repo.delete(api)
  end

  def change_api(%Api{} = api) do
    Api.changeset(api, %{})
  end
end
