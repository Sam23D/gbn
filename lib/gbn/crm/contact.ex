defmodule Gbn.CRM.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contacts" do
    field :address, :string
    field :address_secondary, :string
    field :celphone, :string
    field :city, :string
    field :company_name, :string
    field :email, :string
    field :jobarea, :string
    field :jobtitle, :string
    field :lastname, :string
    field :name, :string
    field :phone, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :lastname, :celphone, :phone, :email, :jobtitle, :jobarea, :company_name, :address, :address_secondary, :city, :state])
    |> validate_required([:name, :lastname, :celphone, :phone, :email, :jobtitle, :jobarea, :company_name, :address, :address_secondary, :city, :state])
  end
end
