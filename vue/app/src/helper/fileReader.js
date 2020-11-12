// async awaitで書けるようにするため読み込むライブラリが変わる
const fs = require('fs').promises
const fileReader = async (filePath) => {
 // ファイルの中身を読み込むまで処理を停止
 const result = await fs.readFile(filePath, "utf-8")
 return result
}
/**
*
* 下と同じ
const fileReader = (filePath) => {
 // Promiseを返してあげる
 return new Promise((resolve, reject) => {
   fs.readFile(filePath, "utf-8", (err, data) => {
     // 失敗時にはreject
     if (err) reject(err)
     // 処理成功時にはresolve
     resolve(data)
     return
   })
 })
}
*/
async function main() {
  try {
    const data = await fileReader("../assets/number.txt")
    console.log(data)
   } catch(e) {
    console.log(e)
   }

}

main()
