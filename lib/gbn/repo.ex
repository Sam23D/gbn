defmodule Gbn.Repo do
  use Ecto.Repo,
    otp_app: :gbn,
    adapter: Ecto.Adapters.Postgres
end
