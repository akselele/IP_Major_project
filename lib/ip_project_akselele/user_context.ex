defmodule IpProjectAkselele.UserContext do
  import Ecto.Query, warn: false
  alias IpProjectAkselele.Repo

  alias IpProjectAkselele.UserContext.User

  defdelegate get_acceptable_roles(), to: User

  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def update_username(%User{} = user, attrs) do
    user
    |> User.changeset_username(attrs)
    |> Repo.update()
  end

  def change_password(%User{} = user) do
    User.changeset_password(user, %{})
  end

  def update_password(%User{} = user, attrs) do
    user
    |> User.changeset_password(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def change_username(%User{} = user) do
    User.changeset_username(user, %{})
  end

  def authenticate_user(username, plain_text_password) do
    case Repo.get_by(User, username: username) do
      nil ->
        Pbkdf2.no_user_verify()
        {:error, :invalid_credentials}

      user ->
        if Pbkdf2.verify_pass(plain_text_password, user.hashed_password) do
          {:ok, user}
        else
          {:error, :invalid_credentials}
        end
    end
  end

  def get_user(id), do: Repo.get(User, id)
end
