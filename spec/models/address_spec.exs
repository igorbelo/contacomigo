defmodule AddressSpec do
  use ESpec
  import ContaComigo.Factory
  alias ContaComigo.Address

  describe "validations" do
    it "is invalid without a customer" do
      changeset = Address.changeset(
        %Address{},
        params_for(:address, customer_id: nil)
      )
      {error_message, _} = changeset.errors[:customer_id]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a state" do
      changeset = Address.changeset(
        %Address{},
        params_for(:address, state: nil)
      )
      {error_message, _} = changeset.errors[:state]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a city" do
      changeset = Address.changeset(
        %Address{},
        params_for(:address, city: nil)
      )
      {error_message, _} = changeset.errors[:city]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a zip code" do
      changeset = Address.changeset(
        %Address{},
        params_for(:address, zip_code: nil)
      )
      {error_message, _} = changeset.errors[:zip_code]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a line1" do
      changeset = Address.changeset(
        %Address{},
        params_for(:address, line1: nil)
      )
      {error_message, _} = changeset.errors[:line1]
      expect(error_message).to eq("can't be blank")
    end

    it "is valid with state, city, zip code, line1 and customer" do
      changeset = Address.changeset(
        %Address{},
        params_for(:address)
      )
      expect(changeset.errors).to be_empty()
    end
  end
end
