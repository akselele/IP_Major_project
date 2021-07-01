defmodule IpProjectAkselele.ApiContext.Api do
  use Ecto.Schema
  import Ecto.Changeset
  alias IpProjectAkselele.UserContext.User


  schema "apis" do
    field :name, :string
    field :key, :string
    belongs_to :user, User
  end

  def create_changeset(api, attrs, user) do
    api
    |> cast(attrs, [:name, :key])
    |> validate_required([:name, :key])
    |> put_assoc(:user, user)
  end

  @doc false
  def changeset(api, attrs) do
    api
    |> cast(attrs, [:name, :key])
    |> validate_required([:name, :key])
  end
end
