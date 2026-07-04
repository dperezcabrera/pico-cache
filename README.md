# 📦 pico-cache

[![PyPI](https://img.shields.io/pypi/v/pico-cache.svg)](https://pypi.org/project/pico-cache/)
[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/dperezcabrera/pico-cache)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
![CI (tox matrix)](https://github.com/dperezcabrera/pico-cache/actions/workflows/ci.yml/badge.svg)
[![codecov](https://codecov.io/gh/dperezcabrera/pico-cache/branch/main/graph/badge.svg)](https://codecov.io/gh/dperezcabrera/pico-cache)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=dperezcabrera_pico-cache&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=dperezcabrera_pico-cache)
[![Duplicated Lines (%)](https://sonarcloud.io/api/project_badges/measure?project=dperezcabrera_pico-cache&metric=duplicated_lines_density)](https://sonarcloud.io/summary/new_code?id=dperezcabrera_pico-cache)
[![Maintainability Rating](https://sonarcloud.io/api/project_badges/measure?project=dperezcabrera_pico-cache&metric=sqale_rating)](https://sonarcloud.io/summary/new_code?id=dperezcabrera_pico-cache)
[![PyPI Downloads](https://img.shields.io/pypi/dm/pico-cache)](https://pypi.org/project/pico-cache/)
[![Docs](https://img.shields.io/badge/Docs-pico--cache-blue?style=flat&logo=readthedocs&logoColor=white)](https://dperezcabrera.github.io/pico-cache/)
[![Interactive Lab](https://img.shields.io/badge/Learn-online-green?style=flat&logo=python&logoColor=white)](https://dperezcabrera.github.io/pico-learn/)

Declarative **method caching** for the [Pico](https://github.com/dperezcabrera/pico-ioc) ecosystem: `@cacheable` over pico-ioc method interception, pluggable backends, auto-discovered by [pico-boot](https://github.com/dperezcabrera/pico-boot). Zero-config.

## Install

```bash
pip install pico-cache
```

## Use

```python
from pico_ioc import component
from pico_cache import cacheable

@component
class UserRepo:
    @cacheable(ttl_seconds=60)
    async def find(self, user_id: int): ...

    @cacheable(key=lambda q: f"search:{q}")
    def search(self, q: str): ...
```

Sync and async (the awaited **result** is cached, never the coroutine). Default backend: thread-safe in-memory LRU with per-entry TTL (`cache.max_entries`, `cache.default_ttl_seconds`). Bring your own backend by implementing the `CacheBackend` protocol as a `@component` — it replaces the built-in automatically.

```yaml
# application.yaml (optional)
cache:
  default_ttl_seconds: 300
  max_entries: 1024
```

Skipped for now: `@cache_evict` and a Redis backend — planned once real usage asks for them.

## Documentation

Full docs at **[dperezcabrera.github.io/pico-cache](https://dperezcabrera.github.io/pico-cache/)**.

## License

MIT
