defmodule Rumbrella.Mixfile do
  use Mix.Project

  def project do
    [apps_path: "apps",
     version: append_revision("0.0.1"),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def append_revision(version) do
    "#{version}+#{revision()}"
  end

  defp revision() do
    System.cmd("git", ["rev-parse", "--short", "HEAD"])
    |> elem(0)
    |> String.rstrip
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options.
  #
  # Dependencies listed here are available only for this project
  # and cannot be accessed from applications inside the apps folder
  def application do
    [applications: [
      :edeliver
    ]]
  end

  defp deps do
    [
      {:edeliver, "~> 1.4.2"},
      {:distillery, ">= 0.8.0", warn_missing: false},
    ]
  end
end
