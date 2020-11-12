module.exports = {
    root: true,
    parser: 'vue-eslint-parser',
    parserOptions: {
      parser: 'babel-eslint',
      sourceType: 'module'
    },
    env: {
      browser: true,
      node: true
    },
    extends: [
      'eslint:recommended',
      'plugin:prettier/recommended',
      'plugin:vue/recommended',
      'prettier/vue',
    ],
    rules: {
      //実運用に合わせて追加していく
      'no-plusplus': 'off',
      'func-names': 'off',
      'vue/component-name-in-template-casing': 'off',
      'no-console': 'off',
      'no-debugger': 'error',
      "import/prefer-default-export": "off", // default exportだと変数・関数が使えないのでOFF
      "import/no-unresolved": 'off', // Vueの@とか~が使えなくなるため追加
      // セミコロンを省略する
      "semi": ["error", "never", {"beforeStatementContinuationChars": "never"}],
      "semi-spacing": ["error", {"after": true, "before": false}],
      "semi-style": ["error", "first"],
      "no-extra-semi": "error",
      "no-unexpected-multiline": "error",
      "no-unreachable": "error",
      // 文字列はシングルクォートにする
      "quotes": ["warn", "single"],
      // [Todo] Promise.allの結果をletに入れようとすると;を入れろと言うエラーが出るのでwarnに変える。調査次第消す。
      "prettier/prettier": "warn"
    },
    settings: {
      "import/resolver": {
        "babel-module": {
          "root": '.',
          "alias": {
            "~": "./app/src",
            "@": "./app/src",
            "~~": ".",
            "@@": "."
          }
        },
        alias: {
          extensions: [".vue", ".json", ".js"]
        }
      }
    }
};
