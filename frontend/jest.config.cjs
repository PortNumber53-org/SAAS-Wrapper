/** @type {import('ts-jest').JestConfigWithTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/test/unit/support/hooks.ts'],
  moduleFileExtensions: ['js', 'ts', 'json', 'node'],
};