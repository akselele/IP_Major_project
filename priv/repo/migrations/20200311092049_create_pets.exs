defmodule IpProjectAkselele.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string, null: false
      add :cat_or_dog, :string, null: false
      add :dob, :date, null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
    end

    create index(:pets, [:user_id])
  end
end
