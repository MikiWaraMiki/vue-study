const axios = require('axios')
const fs = require('fs').promises
const fileReader = async (filePath) => {
  // ファイルの中身を読み込むまで処理を停止
  const result = await fs.readFile(filePath, "utf-8")
  return result
}
const apiReader = async (url) => {
  const result = await axios.get(url)
  return result
}

async function main() {
  try {
    const url = "https://localhost:3000/api/v1/for_clients/professionals"
    const filePath = "../assets/number.txt"
    const [fileData, apiData] = await Promise.all([
      fileReader(filePath),
      apiReader(url)
    ])
    console.log(fileData)
    console.log(apiData.data)
  } catch(e) {
    console.log(e)
  }
}
main()
