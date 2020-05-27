const host = 'http://119.3.25.247:1111'

exports.request = async (path, body={}) => {
  const resp = await fetch(`${host}${path}`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(body)
  })
  return resp.json()
}