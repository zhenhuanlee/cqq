export default {
  async all() {
    const resp = await fetch('http://192.168.2.1:1111/1000')
    const json = await resp.json()
    return json
  }
}