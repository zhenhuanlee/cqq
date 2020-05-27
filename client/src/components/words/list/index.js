import React, { Component } from 'react'
import './index.css'
import Word from '../../../model/word'

class List extends Component {
  constructor() {
    super()
    this.state = { words: [] }
  }

  async componentDidMount() {
    const words = await Word.all(0)
    this.setState({ words: words })
  }

  render() {
    return (
      <div className="halfWidthDiv">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>EN</th>
              <th>CN</th>
            </tr>
          </thead>
          <tbody>
            {
              this.state.words.map(item => (
                <tr key={item.ID}>
                  <td> {item.ID} </td>
                  <td> {item.EN} </td>
                  <td> {item.CN} </td>
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