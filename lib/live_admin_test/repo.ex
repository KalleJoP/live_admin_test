defmodule LiveAdminTest.Repo do
  use Ecto.Repo,
    otp_app: :live_admin_test,
    adapter: Ecto.Adapters.Postgres
end
