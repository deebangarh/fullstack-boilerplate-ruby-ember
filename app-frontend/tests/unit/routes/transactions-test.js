import { module, test } from 'qunit';
import { setupTest } from 'app-frontend/tests/helpers';

module('Unit | Route | transactions', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    let route = this.owner.lookup('route:transactions');
    assert.ok(route);
  });
});
