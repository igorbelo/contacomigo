defmodule LineItemSpec do
  use ESpec
  import ContaComigo.Factory
  alias ContaComigo.LineItem

  describe "validations" do
    it "is invalid without an order" do
      changeset = LineItem.changeset(
        %LineItem{},
        params_for(:line_item, order_id: nil)
      )
      {error_message, _} = changeset.errors[:order_id]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a product" do
      changeset = LineItem.changeset(
        %LineItem{},
        params_for(:line_item, product_id: nil)
      )
      {error_message, _} = changeset.errors[:product_id]
      expect(error_message).to eq("can't be blank")
    end

    it "is invalid without a quantity" do
      changeset = LineItem.changeset(
        %LineItem{},
        params_for(:line_item, quantity: nil)
      )
      {error_message, _} = changeset.errors[:quantity]
      expect(error_message).to eq("can't be blank")
    end

    it "is valid with an order, product and quantity" do
      changeset = LineItem.changeset(
        %LineItem{},
        params_for(:line_item)
      )
      expect(changeset.errors).to be_empty()
    end
  end
end
