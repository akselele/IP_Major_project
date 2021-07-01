defmodule IpProjectAkseleleWeb.PetController do
  use IpProjectAkseleleWeb, :controller
  require Logger
  alias IpProjectAkselele.UserContext
  alias IpProjectAkselele.PetContext
  alias IpProjectAkselele.PetContext.Pet
  alias IpProjectAkseleleWeb.Plugs.ApiHeader

  action_fallback IpProjectAkseleleWeb.FallbackController

  def index(conn, %{"user_id" => id}) do
    case ApiHeader.isCorrect(conn, id) do
      true ->
        user = UserContext.get_user!(id)
        user_with_loaded_pets = PetContext.load_pets(user)
        render(conn, "index.json", pets: user_with_loaded_pets.pets)

      false ->
        conn
        |> send_resp(400, gettext("You have the wrong key/name combination or a wrong key."))
    end
  end

  def create(conn, %{"user_id" => user_id, "pet" => pet_params}) do
    user = UserContext.get_user!(user_id)

    case ApiHeader.isCorrect(conn, user_id) do
      true ->
        case PetContext.create_pet(pet_params, user) do
          {:ok, %Pet{} = pet} ->
            conn
            |> put_status(:created)
            |> put_resp_header("lopetion", Routes.user_pet_path(conn, :show, user_id, pet))
            |> render("show.json", pet: pet)

          {:error, _cs} ->
            conn
            |> send_resp(
              400,
              gettext(
                "Something went wrong, sorry. You need to add pets with the following parameters: 'name', 'date of birth(YYYY-MM-DD)'and 'cat' or 'dog'"
              )
            )
        end

      false ->
        conn
        |> send_resp(400, gettext("You have the wrong key/name combination or a wrong key."))
    end
  end

  def show(conn, %{"id" => idd, "user_id" => id}) do
    case ApiHeader.isCorrect(conn, id) do
      true ->
        pet = PetContext.get_pet(idd)
        render(conn, "show.json", pet: pet)

      false ->
        conn
        |> send_resp(400, gettext("You have the wrong key/name combination or a wrong key."))
    end
  end

  def update(conn, %{"id" => id, "pet" => pet_params, "user_id" => user_id}) do
    case ApiHeader.isCorrect(conn, user_id) do
      true ->
        pet = PetContext.get_pet(id)

        case PetContext.update_pet(pet, pet_params) do
          {:ok, %Pet{} = pet} ->
            render(conn, "show.json", pet: pet)

          {:error, _cs} ->
            conn
            |> send_resp(
              400,
              gettext(
                "Something went wrong, sorry. You need to add pets with the following parameters: 'name', 'date of birth(YYYY-MM-DD)'and 'cat' or 'dog'"
              )
            )
        end

      false ->
        conn
        |> send_resp(400, gettext("You have the wrong key/name combination or a wrong key."))
    end
  end

  def delete(conn, %{"id" => id, "user_id" => user_id}) do
    case ApiHeader.isCorrect(conn, user_id) do
      true ->
        pet = PetContext.get_pet!(id)

        with {:ok, %Pet{}} <- PetContext.delete_pet(pet) do
          send_resp(conn, :no_content, "")
        end

      false ->
        conn
        |> send_resp(400, gettext("You have the wrong key/name combination or a wrong key."))
    end
  end
end
