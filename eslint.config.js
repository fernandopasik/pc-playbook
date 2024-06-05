import prettier from 'eslint-config-prettier';
import ymlPlugin from 'eslint-plugin-yml';

export default [
  { ignores: ['galaxy/', 'venv/'] },
  ...ymlPlugin.configs['flat/recommended'],
  ...ymlPlugin.configs['flat/prettier'],
  prettier,
];
