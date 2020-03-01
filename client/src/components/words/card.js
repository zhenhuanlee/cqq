import React, { Component } from 'react'
import './card.css'

export default class Card extends Component {
  render() {
    return (
      <div className="halfWidthDiv">
        <div>
          <div className="contentDiv">
            <div>HI</div>
            <div>hi, my name is h</div>
          </div>
          <div className="btnsDivContainer">
            <div onClick={this.Yes} className='btnDiv green'>YES</div>
            <div onClick={this.No} className='btnDiv red'>NO</div>
          </div>
        </div>
      </div>
    )
  }

  Yes() {
    console.log('yes')
  }

  No() {
    console.log('no')
  }
}