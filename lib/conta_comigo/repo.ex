defmodule ContaComigo.Repo do
  use Ecto.Repo, otp_app: :conta_comigo
  use Scrivener, page_size: 10
end
