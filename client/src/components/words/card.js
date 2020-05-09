import React, { Component } from 'react'
import './card.css'
import Word from '../../model/word'

export default class Card extends Component {
  constructor() {
    super()
    this.index = 0
    this.state = { word: {} }
  }

  async componentDidMount() {
    this.words = await Word.all()
    this.setState({ word: this.words[this.index] })
  }

  render() {
    return (
      <div className="halfWidthDiv">
        <div>
          <div className="contentDiv">
            <div> {this.state.word.id} </div>
            <div> {this.state.word.word} </div>
          </div>
          <div className="btnsDivContainer">
            <div onClick={this.Yes}  className='btnDiv green'>YES</div>
            <div onClick={this.No}   className='btnDiv red'>NO</div>
            <div onClick={this.next.bind(this)} className='btnDiv'>NEXT</div>
          </div>
        </div>
      </div>
    )
  }

  yes() {
    console.log('yes')
  }

  no() {
    console.log('no')
  }

  next() {
    this.setState({ word: this.words[++this.index] })
    console.log(this.state)
  }
}