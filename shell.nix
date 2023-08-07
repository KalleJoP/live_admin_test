{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    elixir
    erlang
    postgresql
    darwin.apple_sdk.frameworks.Cocoa
    libiconv
    darwin.apple_sdk.frameworks.CoreServices
  ];

}
