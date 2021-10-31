defmodule DocumentConverter.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    IO.puts("Starting app")
    path =
      __ENV__.file
      |> Path.dirname()
      |> Path.join("turndown_wrapper")

    children = [
      %{
        id: NodeJS,
        start: {NodeJS, :start_link, [[path: path, pool_size: 4]]}
      }
    ]

    opts = [strategy: :one_for_one, name: DocumentConverter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
