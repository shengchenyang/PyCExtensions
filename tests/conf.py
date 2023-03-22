from pathlib import Path


class TestConfig:
    test_dir = Path(__file__).parent
    test_data_dir = test_dir / "data"
