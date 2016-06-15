defmodule Judge do
  use Application

  def start(_type, _args) do
    Judge.Supervisor.start_link
  end
end
