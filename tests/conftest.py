import pytest


@pytest.fixture
def make_container(make_container):
    """Extends the plugin fixture: kwargs become the caching config section."""
    plugin_make = make_container

    def _make(module, **cache_cfg):
        return plugin_make(module, config={"caching": cache_cfg})

    return _make
