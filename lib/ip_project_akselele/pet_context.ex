defmodule IpProjectAkselele.PetContext do
  @moduledoc """
  The PetContext context.
  """

  import Ecto.Query, warn: false
  alias IpProjectAkselele.Repo

  alias IpProjectAkselele.PetContext.Pet
  alias IpProjectAkselele.UserContext.User

  @doc """
  Returns the list of pets.


  ## Examples

      iex> list_pets()
      [%Pet{}, ...]

  """

  def load_pets(%User{} = u), do: u |> Repo.preload([:pets])

  def list_pets do
    Repo.all(Pet)
  end

  @doc """
  Gets a single pet.

  Raises `Ecto.NoResultsError` if the Pet does not exist.

  ## Examples

      iex> get_pet!(123)
      %Pet{}

      iex> get_pet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pet!(id), do: Repo.get!(Pet, id)

  @doc """
  Creates a pet.

  ## Examples

      iex> create_pet(%{field: value})
      {:ok, %Pet{}}

      iex> create_pet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pet(attrs, %User{} = user) do
    %Pet{}
    |> Pet.create_changeset(attrs, user)
    |> Repo.insert()
  end

  @doc """
  Updates a pet.

  ## Examples

      iex> update_pet(pet, %{field: new_value})
      {:ok, %Pet{}}

      iex> update_pet(pet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pet(%Pet{} = pet, attrs) do
    pet
    |> Pet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pet.

  ## Examples

      iex> delete_pet(pet)
      {:ok, %Pet{}}

      iex> delete_pet(pet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pet(%Pet{} = pet) do
    Repo.delete(pet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pet changes.

  ## Examples

      iex> change_pet(pet)
      %Ecto.Changeset{source: %Pet{}}

  """
  def change_pet(%Pet{} = pet) do
    Pet.changeset(pet, %{})
  end

  def get_pet(id), do: Repo.get(Pet, id)
end
