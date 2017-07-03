defmodule CustomerSpec do
  use ESpec
  import ContaComigo.Factory
  alias ContaComigo.Customer

  describe "validations" do
    it "is invalid without name" do
      changeset = Customer.changeset(
        %Customer{},
        params_for(:customer, name: nil)
      )
      {error_message, _} = changeset.errors[:name]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without an email" do
      changeset = Customer.changeset(
        %Customer{},
        params_for(:customer, email: nil)
      )
      {error_message, _} = changeset.errors[:email]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a phone" do
      changeset = Customer.changeset(
        %Customer{},
        params_for(:customer, phone: nil)
      )
      {error_message, _} = changeset.errors[:phone]
      expect(error_message).to eq("can't be blank")
    end

    it "is valid with first name, last name, email and phone" do
      changeset = Customer.changeset(
        %Customer{},
        params_for(:customer)
      )
      expect(changeset.errors).to be_empty()
    end
  end
end
