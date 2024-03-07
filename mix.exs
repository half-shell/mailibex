defmodule Mailibex.Mixfile do
  use Mix.Project

  def app, do: :mailibex

  def version, do: "0.2.0"

  def source_url, do: "https://github.com/kbrw/#{app()}"

  def project do
    [app: app(),
     version: version(),
     elixir: "~> 1.12",
     description: description(),
     package: package(),
     compilers: [:elixir_make, :elixir, :app],
     deps: deps(),
     docs: docs(),
     elixirc_options: [warnings_as_errors: true],
     ]
  end

  def application do
    [
      extra_applications: [
        :crypto,
        :inets,
        :logger,
        :public_key,
        :ssl,
      ],
    ]
  end

  defp package do
    [ maintainers: ["Arnaud Wetzel","heri16"],
      licenses: ["The MIT License (MIT)"],
      links: %{
        "Changelog" => "https://hexdocs.pm/#{app()}/changelog.html",
        "GitHub" => source_url()
      },
    ]
  end

  defp description do
    """
    Mailibex is an email library in Elixir : currently implements
    DKIM, SPF, DMARC, MimeMail (using iconv nif for encoding),
    MimeType (and file type detection), a simplified api to modify or create
    mimemail as a keyword list.
    """
  end

  defp deps do
    [
      {:codepagex, "~> 0.1", optional: true},
      {:ex_doc, "~> 0.31", only: :dev, runtime: false},
      {:elixir_make, "~> 0.7", runtime: false}
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md": [title: "Changelog"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: source_url(),
      # We need to git tag with the corresponding format.
      source_ref: "v#{version()}",
    ]
  end
end
