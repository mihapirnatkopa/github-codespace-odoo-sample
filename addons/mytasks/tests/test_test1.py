from odoo.tests import TransactionCase
class TestModelA(TransactionCase):
    def setup(self):
        print("executing setup . . .")
        super(TestModelA, self).setUp()
    def test_some_action(self):
        self.assertEqual(
            True,
            True)
    def test_some_action2(self):
        self.assertEqual(
            1,
            1)