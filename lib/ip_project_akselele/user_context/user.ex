defmodule IpProjectAkselele.UserContext.User do
  use Ecto.Schema
  import Ecto.Changeset
  
  alias IpProjectAkselele.PetContext.Pet
  alias IpProjectAkselele.ApiContext.Api

  @acceptable_roles ["Admin","User"]

  schema "users" do
    field :password, :string, virtual: true
    field :hashed_password, :string
    field :role, :string
    field :username, :string
    has_many :pets, Pet
    has_many :apis, Api
  end

  def get_acceptable_roles, do: @acceptable_roles

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password, :role])
    |> validate_required([:username, :password, :role])
    |> validate_inclusion(:role, @acceptable_roles)
    |> put_password_hash()
    |> unique_constraint(:username)
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, hashed_password: Pbkdf2.hash_pwd_salt(password))
  end

  def changeset_username(user, params \\ %{}) do
    user
    |> cast(params, [:username], [])
    |> unique_constraint(:username, name: "users.users_username_index")
  end

  def changeset_password(user, params \\ %{}) do
    user
    |> cast(params, [:password], [])
    |> put_password_hash()
  end

  defp put_password_hash(changeset), do: changeset
end
