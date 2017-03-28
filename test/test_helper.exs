ExUnit.start
ExUnit.configure formatters: [JUnitFormatter, ExUnit.CLIFormatter]
Ecto.Adapters.SQL.Sandbox.mode(ContaComigo.Repo, :manual)
{:ok, _} = Application.ensure_all_started(:ex_machina)
