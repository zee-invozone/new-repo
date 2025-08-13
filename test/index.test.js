const { greet, add, multiply } = require('../index');

describe('Basic Functions', () => {
  test('greet function should return correct greeting', () => {
    expect(greet('Zeeshan')).toBe('Hello, Zeeshan! Welcome to CI/CD pipeline practice.');
    expect(greet('World')).toBe('Hello, World! Welcome to CI/CD pipeline practice.');
  });

  test('add function should add two numbers correctly', () => {
    expect(add(2, 3)).toBe(5);
    expect(add(-1, 1)).toBe(0);
    expect(add(0, 0)).toBe(0);
  });

  test('multiply function should multiply two numbers correctly', () => {
    expect(multiply(4, 5)).toBe(20);
    expect(multiply(0, 5)).toBe(0);
    expect(multiply(-2, 3)).toBe(-6);
  });
});
