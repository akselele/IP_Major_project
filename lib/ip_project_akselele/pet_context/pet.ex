defmodule IpProjectAkselele.PetContext.Pet do
  use Ecto.Schema
  import Ecto.Changeset
  alias IpProjectAkselele.UserContext.User


  @acceptable_cat_or_dog ["cat","dog"]

  schema "pets" do
    field :cat_or_dog, :string
    field :name, :string
    field :dob, :date
    belongs_to :user, User
  end

  def create_changeset(pet, attrs, user) do
    pet
    |> cast(attrs, [:name, :cat_or_dog, :dob])
    |> validate_required([:name, :cat_or_dog, :dob])
    |> put_assoc(:user, user)
    |> validate_inclusion(:cat_or_dog, @acceptable_cat_or_dog)
  end

  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :cat_or_dog, :dob])
    |> validate_required([:name, :cat_or_dog, :dob])
  end
end
