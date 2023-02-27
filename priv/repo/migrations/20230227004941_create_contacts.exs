defmodule Gbn.Repo.Migrations.CreateContacts do
  use Ecto.Migration

  def change do
    create table(:contacts) do
      add :name, :string
      add :lastname, :string
      add :celphone, :string
      add :phone, :string
      add :email, :string
      add :jobtitle, :string
      add :jobarea, :string
      add :company_name, :string
      add :address, :string
      add :address_secondary, :string
      add :city, :string
      add :state, :string

      timestamps()
    end
  end
end
