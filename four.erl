-module(four).
-export([find_hash/2, test/0, run/0]).

find_hash(Base, Hash, N, Zeroes) ->
	Bits = Zeroes * 4,
	case Hash of
		<<0:Bits, _/bitstring>> ->
			N;
		_ ->
			find_hash(Base, erlang:md5(Base ++ integer_to_list(N+1)), N+1, Zeroes)
	end.

find_hash(Key, Zeroes) ->
	find_hash(Key, erlang:md5(Key ++ integer_to_list(0)), 0, Zeroes).

test() ->
	609043 = find_hash("abcdef", 5),
	1048970 = find_hash("pqrstuv", 5).

run() ->
	{find_hash("bgvyzdsv", 5), find_hash("bgvyzdsv", 6)}.
