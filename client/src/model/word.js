import { request } from './_common'

export default {
  async all (page) {
    return request(`/words/all?page=${page}`)
  },

  async find () {
    // TODO
  },

  async create(body) {
    return request(`/words/create`, body)
  }
}