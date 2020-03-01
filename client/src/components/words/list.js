import React, { Component } from 'react'
import './list.css'
import Word from '../../model/word'

class List extends Component {
  constructor() {
    super()
    this.state = {
      words: []
    }
  }

  async componentDidMount() {
    this.setState({words: await Word.all()})
  }

  render() {
    return (
      <div className="halfWidthDiv">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>WORD</th>
              <th>MASTER</th>
            </tr>
          </thead>
          <tbody>
            {
              this.state.words.map(item => (
                <tr>
                  <td> {item.id} </td>
                  <td> {item.word} </td>
                  <td className={item.master ? 'green' : 'red'}>
                    {item.master ? 'Y' : 'F'}
                  </td>
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