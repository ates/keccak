-module(keccak).

-export([hash_256/1]).

-include("cargo.hrl").
-on_load(init/0).
-define(NOT_LOADED, not_loaded(?LINE)).

hash_256(_Data) -> ?NOT_LOADED.

init() ->
    ?load_nif_from_crate(keccak, 0).

not_loaded(Line) ->
    erlang:nif_error({not_loaded, [{module, ?MODULE}, {line, Line}]}).
