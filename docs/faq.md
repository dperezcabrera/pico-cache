# FAQ

## What is the default cache key?

`module.Class.method(repr(args);sorted kwargs)`. Arguments must have stable
`repr`s; pass `key=callable` for anything fancier.

## Does it cache exceptions?

No. Only successful results are stored; a raising method is re-executed on
the next call.

## Is there a `@cache_evict`?

Not yet — inject the backend and call `delete`/`clear` for now. Planned when
real usage asks for it.

## Is the built-in backend safe under threads?

Yes: one lock around an `OrderedDict` LRU; expiry uses `time.monotonic`.
