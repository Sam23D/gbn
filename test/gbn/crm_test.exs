defmodule Gbn.CRMTest do
  use Gbn.DataCase

  alias Gbn.CRM

  describe "contacts" do
    alias Gbn.CRM.Contact

    import Gbn.CRMFixtures

    @invalid_attrs %{address: nil, address_secondary: nil, celphone: nil, city: nil, company_name: nil, email: nil, jobarea: nil, jobtitle: nil, lastname: nil, name: nil, phone: nil, state: nil}

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert CRM.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert CRM.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      valid_attrs = %{address: "some address", address_secondary: "some address_secondary", celphone: "some celphone", city: "some city", company_name: "some company_name", email: "some email", jobarea: "some jobarea", jobtitle: "some jobtitle", lastname: "some lastname", name: "some name", phone: "some phone", state: "some state"}

      assert {:ok, %Contact{} = contact} = CRM.create_contact(valid_attrs)
      assert contact.address == "some address"
      assert contact.address_secondary == "some address_secondary"
      assert contact.celphone == "some celphone"
      assert contact.city == "some city"
      assert contact.company_name == "some company_name"
      assert contact.email == "some email"
      assert contact.jobarea == "some jobarea"
      assert contact.jobtitle == "some jobtitle"
      assert contact.lastname == "some lastname"
      assert contact.name == "some name"
      assert contact.phone == "some phone"
      assert contact.state == "some state"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CRM.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      update_attrs = %{address: "some updated address", address_secondary: "some updated address_secondary", celphone: "some updated celphone", city: "some updated city", company_name: "some updated company_name", email: "some updated email", jobarea: "some updated jobarea", jobtitle: "some updated jobtitle", lastname: "some updated lastname", name: "some updated name", phone: "some updated phone", state: "some updated state"}

      assert {:ok, %Contact{} = contact} = CRM.update_contact(contact, update_attrs)
      assert contact.address == "some updated address"
      assert contact.address_secondary == "some updated address_secondary"
      assert contact.celphone == "some updated celphone"
      assert contact.city == "some updated city"
      assert contact.company_name == "some updated company_name"
      assert contact.email == "some updated email"
      assert contact.jobarea == "some updated jobarea"
      assert contact.jobtitle == "some updated jobtitle"
      assert contact.lastname == "some updated lastname"
      assert contact.name == "some updated name"
      assert contact.phone == "some updated phone"
      assert contact.state == "some updated state"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = CRM.update_contact(contact, @invalid_attrs)
      assert contact == CRM.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = CRM.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> CRM.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = CRM.change_contact(contact)
    end
  end
end
