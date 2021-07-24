defmodule StarwarsStoreApi.Repo do
  use Ecto.Repo,
    otp_app: :starwars_store_api,
    adapter: Ecto.Adapters.Postgres
end
