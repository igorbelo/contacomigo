defmodule ProductSpec do
  use ESpec
  import ContaComigo.Factory
  alias ContaComigo.Product

  describe "validations" do
    it "is invalid without a price" do
      changeset = Product.changeset(
        %Product{},
        params_for(:product, price: nil)
      )
      {error_message, _} = changeset.errors[:price]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a name" do
      changeset = Product.changeset(
        %Product{},
        params_for(:product, name: nil)
      )
      {error_message, _} = changeset.errors[:name]
      expect(error_message).to eq("can't be blank")
    end

    it "is valid with a name and price" do
      changeset = Product.changeset(
        %Product{},
        params_for(:product)
      )
      expect(changeset.errors).to be_empty()
    end
  end
end
