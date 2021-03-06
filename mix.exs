defmodule Agala.Mixfile do
  use Mix.Project

  def project do
    [app: :agala,
     version: "2.0.0-rc1",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     aliases: aliases(),
     test_coverage: [tool: Coverex.Task, coveralls: true],
     docs: docs(),
     deps: deps()]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      test: "test --no-start"
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev},
      {:inch_ex,"~> 0.5", only: :docs},
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:coverex, "~> 1.4.15", only: :test}
    ]
  end

  defp description do
    """
    Full featured messaging bot framework.
    """
  end

  defp docs do
    [
      main: "getting-started",
      logo: "extras/agala.svg.png",
      extras: [
        "extras/Getting Started.md",
        "extras/Usage.md"
      ]
    ]
  end

  defp package do
    [
      maintainers: ["Dmitry Rubinstein", "Vladimir Barsukov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/agalaframework/agala"},
      files: ~w(mix.exs README* CHANGELOG* lib)
    ]
  end
end
