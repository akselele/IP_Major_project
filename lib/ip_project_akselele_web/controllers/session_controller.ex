defmodule IpProjectAkseleleWeb.SessionController do
  use IpProjectAkseleleWeb, :controller

  alias IpProjectAkseleleWeb.Guardian
  alias IpProjectAkselele.UserContext
  alias IpProjectAkselele.UserContext.User

  def new(conn, _) do
    changeset = UserContext.change_user(%User{})
    maybe_user = Guardian.Plug.current_resource(conn)

    if maybe_user do
      redirect(conn, to: "/user_scope")
    else
      render(conn, "login.html", changeset: changeset, action: Routes.session_path(conn, :login))
    end
  end

  def login(conn, %{"user" => %{"username" => username, "password" => password}}) do
    UserContext.authenticate_user(username, password)
    |> login_reply(conn)
  end

  def logout(conn, _) do
    conn
    |> Guardian.Plug.sign_out()
    |> redirect(to: "/login")
  end

  defp login_reply({:ok, user}, conn) do
    conn
    |> put_flash(:info, gettext("Welcome back!"))
    |> Guardian.Plug.sign_in(user)
    |> redirect(to: "/dashboard")
  end

  defp login_reply({:error, reason}, conn) do
    conn
    |> put_flash(:error, gettext("Username or password is incorrect."))
    |> new(%{})
  end

  def showSignup(conn,_) do
      changeset = UserContext.change_user(%User{})
      roles = ["User"]
      render(conn, "signup.html", changeset: changeset, acceptable_roles: roles, action: Routes.session_path(conn, :signup))
  end

  def signup(conn, %{"user" => user_params}) do
      case UserContext.create_user(user_params) do
        {:ok, _user} ->
          conn
          |> put_flash(:info, gettext("Signed up successfully! Now please login!"))
          |> redirect(to: "/login")
        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "signup.html", changeset: changeset, action: Routes.session_path(conn, :showSignup), acceptable_roles: ["User"])
      end
  end
end