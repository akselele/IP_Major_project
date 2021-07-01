defmodule IpProjectAkseleleWeb.PetView do
  use IpProjectAkseleleWeb, :view

  alias IpProjectAkseleleWeb.PetView

  def render("index.json", %{pets: pets}) do
    %{data: render_many(pets, PetView, "pet.json")}
  end

  def render("show.json", %{pet: pet}) do
    %{data: render_one(pet, PetView, "pet.json")}
  end

  def render("pet.json", %{pet: pet}) do
    %{id: pet.id, name: pet.name, cat_or_dog: pet.cat_or_dog, dob: pet.dob}
  end
end
