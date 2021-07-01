defmodule IpProjectAkselele.PetContextTest do
  use IpProjectAkselele.DataCase

  alias IpProjectAkselele.PetContext

  describe "pets" do
    alias IpProjectAkselele.PetContext.Pet

    @valid_attrs %{cat_or_dog: "some cat_or_dog", name: "some name"}
    @update_attrs %{cat_or_dog: "some updated cat_or_dog", name: "some updated name"}
    @invalid_attrs %{cat_or_dog: nil, name: nil}

    def pet_fixture(attrs \\ %{}) do
      {:ok, pet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PetContext.create_pet()

      pet
    end

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert PetContext.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert PetContext.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      assert {:ok, %Pet{} = pet} = PetContext.create_pet(@valid_attrs)
      assert pet.cat_or_dog == "some cat_or_dog"
      assert pet.name == "some name"
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PetContext.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{} = pet} = PetContext.update_pet(pet, @update_attrs)
      assert pet.cat_or_dog == "some updated cat_or_dog"
      assert pet.name == "some updated name"
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = PetContext.update_pet(pet, @invalid_attrs)
      assert pet == PetContext.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = PetContext.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> PetContext.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = PetContext.change_pet(pet)
    end
  end
end
