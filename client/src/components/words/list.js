import React, { Component } from 'react'
import './list.css'

class List extends Component {
  constructor() {
    super()
    this.state = {
      words: []
    }
  }

  componentDidMount() {
    fetch('http://192.168.2.1:1323/1000').then(resp => (
      resp.json()
    )).then(json => {
      this.setState({words: json})
    })
  }

  render() {
    return (
      <div className="halfWidthDiv">
        <table>
          <thead>
            <tr>
              <th>WORD</th>
              <th>MASTER</th>
            </tr>
          </thead>
          <tbody>
            {
              this.state.words.map(item => (
                <tr>
                  <td> {item} </td>
                  {item.length>4 ?
                    <td style={{color: 'red'}}>   N </td> :
                    <td style={{color: 'green'}}> F </td>}
                </tr>
              ))
            }
          </tbody>
        </table>
      </div>
    )
  }
}

export default List