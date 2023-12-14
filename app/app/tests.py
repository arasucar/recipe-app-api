"""
Sample tests
"""
from django.test import SimpleTestCase
from . import calc


class CalcTest(SimpleTestCase):
    """Test the calc module"""

    def test_add_numbers(self):
        """Test adding numbers"""
        res = calc.add(5, 6)
        self.assertEqual(11, res)

    def test_subtract_numbers(self):
        """Test subtracting numbrs"""
        res = calc.subtract(10, 15)

        self.assertEqual(5, res)
