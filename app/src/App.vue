<template>
  <div id="app">
    <div class="p-text-area">
      <h3>テキストエリア</h3>
      <textarea v-model="textArea" placeholder="placeholder"></textarea>
      <p>{{ textArea }}</p>
    </div>
    <div class="p-checkbox">
      <h3>チェックボックス </h3>
      <div class="single">
        <h4>チェックボックス だけが1つだけの場合</h4>
        <label for="checkbox">
          チェックボックス
        </label>
        <input id="checkbox" type="checkbox" v-model="checkVal" >
        <p>{{ checkVal }}</p>
        <p>{{ checkboxText }}</p>
      </div>
      <div class="multi">
        <h4>チェックボックス が複数の場合</h4>
        <div v-for="item in items" :key="item.key">
          <label :for="item.key">
            {{ item.val }}
          </label>
          <input :id="item.key" type="checkbox" :value="item.key" v-model="selectItems" />
        </div>
        <p>{{ selectItems }}</p>
      </div>
    </div>
    <div class="p-radio">
      <h3>ラジオボタン</h3>
      <div v-for="item in radioItems" :key="item.key">
        <label :for="item.key">
          好きな酒は{{ item.val }}
        </label>
        <input :id="item.key" type="radio" :value="item.key" v-model="selectRadioItem" />
      </div>
      <p>{{ selectRadioItem }}</p>
    </div>
    <div class="p-select">
      <h3>セレクトボックス</h3>
      <select v-model="selectedItem">
        <option disabled="disabled">選択してください</option>
        <option v-for="item in selectBoxItems" :key="item.key" :value="item.key">
          {{ item.val }}
        </option>
      </select>
      <p>選択したスタンプは{{selectedItem}}です</p>
    </div>
    <div class="p-file">
      <h3>ファイルのアップロード</h3>
      <input type="file" @change="handleImage" />
      <div v-if="preview">
        <img :src="preview" />
      </div>
      <div v-else>
        <p>画像が選択されていません</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      textArea: 'テキストエリアの内容',
      checkVal: false,
      selectItems: [],
      selectRadioItem: '',
      radioItems: [
        {key: 'split', val: 'スピリッツ' },
        {key: 'cocalero', val: 'コカレロ'},
        {key: 'absinthe', val: 'アブサン'},
      ],
      items: [
        {key: 'orange', val: 'オレンジ'},
        {key: 'banana', val: 'バナナ'},
        {key: 'grape', val: 'ぶどう'}
      ],
      selectBoxItems: [
        {key: 'iyadesu', val: 'いやです'},
        {key: 'damedesu', val: 'だめです'},
        {key: 'usodesu', val: 'ウソです'},
      ],
      selectedItem: '',
      preview: undefined
    }
  },
  computed: {
    checkboxText() {
      if (this.checkVal) return '選択されています'
      return '選択されていません'
  }
  },
  methods: {
    handleImage(e) {
      const file = e.target.files[0]
      if ( file && file.type.match(/^image\/(png|jpeg|jpg)$/) ) {
        this.preview = window.URL.createObjectURL(file)
      }
    }
  },
}
</script>
<style scoped>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
