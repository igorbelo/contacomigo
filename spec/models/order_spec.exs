defmodule OrderSpec do
  use ESpec
  import ContaComigo.Factory
  alias ContaComigo.Order

  describe "validations" do
    it "is invalid without a customer" do
      changeset = Order.changeset(
        %Order{},
        params_for(:order, customer: nil)
      )
      {error_message, _} = changeset.errors[:customer_id]
      expect(error_message).to eq("can't be blank")
    end

    it "is valid with a customer" do
      changeset = Order.changeset(
        %Order{},
        params_with_assocs(:order)
      )
      expect(changeset.errors).to be_empty()
    end
  end
end
