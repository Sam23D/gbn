defmodule Gbn.CRMFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Gbn.CRM` context.
  """

  @doc """
  Generate a contact.
  """
  def contact_fixture(attrs \\ %{}) do
    {:ok, contact} =
      attrs
      |> Enum.into(%{
        address: "some address",
        address_secondary: "some address_secondary",
        celphone: "some celphone",
        city: "some city",
        company_name: "some company_name",
        email: "some email",
        jobarea: "some jobarea",
        jobtitle: "some jobtitle",
        lastname: "some lastname",
        name: "some name",
        phone: "some phone",
        state: "some state"
      })
      |> Gbn.CRM.create_contact()

    contact
  end
end
