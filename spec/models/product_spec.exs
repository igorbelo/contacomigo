defmodule ProductSpec do
  use ESpec
  import ContaComigo.Factory

  it "test" do
    product = build(:product)
    IO.puts product.name
  end
end
