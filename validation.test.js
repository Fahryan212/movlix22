const { validateEmail, validatePassword } = require('../utils/validation');

describe('Validation Tests', () => {
  test('validateEmail should return true for valid email', () => {
    expect(validateEmail('user@example.com')).toBe(true);
  });

  test('validatePassword should return true for strong password', () => {
    expect(validatePassword('StrongPass123')).toBe(true);
  });
});