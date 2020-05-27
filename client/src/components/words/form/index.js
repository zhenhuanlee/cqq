import React, { Component } from 'react'
import Word from '../../../model/word'
import './index.scss'

export default class Form extends Component {
  constructor() {
    super()

    this.word = {}
  }

  async componentDidMount () {
    if (!this.props.match.params.id) return
  }

  render () {
    return (
      <div class="newWordForm">
        <fieldset>
          <label>EN</label>
          <input type="text" value={this.props.EN} onChange={this.changeEN.bind(this)}></input>
        </fieldset>
        
        <fieldset>
          <label>CN</label>
          <input type="text" value={this.props.CN} onChange={this.changeCN.bind(this)}></input>
        </fieldset>

        <button onClick={this.submit.bind(this)}>SUBMIT</button>
      </div>
    )
  }

  changeEN(event) {
    this.word.EN = event.target.value
  }

  changeCN(event) {
    this.word.CN = event.target.value
  }

  async submit() {
    console.log(this.word)
    const res = await Word.create(this.word)
    if (res.code === 0) return alert('success')
    alert('failed')
  }
}