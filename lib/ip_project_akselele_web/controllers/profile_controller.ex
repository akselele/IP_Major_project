defmodule IpProjectAkseleleWeb.ProfileController do
  use IpProjectAkseleleWeb, :controller

  alias IpProjectAkseleleWeb.Guardian
  alias IpProjectAkselele.UserContext
  alias IpProjectAkselele.ApiContext
  alias IpProjectAkselele.ApiContext.Api
  alias IpProjectAkselele.UserContext.User

  def showProfile(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    changeset = ApiContext.change_api(%Api{})
    render(conn, "profile.html", user: user, changeset: changeset, action: Routes.api_path(conn, :generate))
  end

  def showChangeusername(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    changeset = UserContext.change_username(user)

    render(conn, "username.html",
      user: user,
      changeset: changeset,
      action: Routes.profile_path(conn, :changeUsername)
    )
  end

  def changeUsername(conn, %{"user" => user_params}) do
    user = Guardian.Plug.current_resource(conn)

    case UserContext.update_username(user, user_params) do
      {:ok, %User{}} ->
        conn
        |> put_flash(:info, gettext("Username changed successfully!"))
        |> redirect(to: Routes.profile_path(conn, :showProfile))

      {:error, changeset} ->
        render(conn, "username.html", user: user, changeset: changeset, action: Routes.profile_path(conn, :showChangeusername))
    end
  end

  def showChangepassword(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    changeset = UserContext.change_password(user)

    render(conn, "password.html",
      user: user,
      changeset: changeset,
      action: Routes.profile_path(conn, :changePassword)
    )
  end

  def changePassword(conn, %{"user" => user_params}) do
    user = Guardian.Plug.current_resource(conn)

    case UserContext.authenticate_user(user.username, user_params["old_password"]) do
      {:ok, %User{} = user} ->
        case UserContext.update_password(user, user_params) do
          {:ok, %User{}} ->
            conn
            |> put_flash(:info, gettext("Changed password successfully!"))
            |> redirect(to: "/profile")
        end

      {:error, :invalid_credentials} ->
        conn
        |> put_flash(:error, gettext("Your current password isn't correct."))
        |> redirect(to: "/profile/edit/password")
    end
  end
end
