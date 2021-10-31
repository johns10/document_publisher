defmodule DocumentConverter.MixProject do
  use Mix.Project

  def project do
    [
      app: :document_converter,
      version: "0.1.0",
      elixir: "~> 1.13-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {DocumentConverter.Application, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.6.2"},
      {:jason, "~> 1.2.2"},
      {:nodejs, "~> 2.0"},
      {:earmark_parser, "~>1.4"},
      {:chrome_remote_interface, "~> 0.4.1"},
      {:inflex, "~> 2.0.0"}
    ]
  end
end
