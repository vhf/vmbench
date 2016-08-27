defmodule CowboyElixir.Mixfile do
  use Mix.Project

  def project do
    [app: :cowboy_elixir,
     version: "0.0.2",
     elixir: "~> 1.2",
     deps: deps]
  end

  def application do
    [
      mod: { CowboyElixir, [] },
      applications: [:cowboy, :ranch]
    ]
  end

  defp deps do
    [ { :cowboy, "~> 1.0.0" } ]
  end
end
