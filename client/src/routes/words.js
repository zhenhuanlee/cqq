import React from 'react'
import { Route } from 'react-router-dom'
import { List, Card, Form } from '../components/words'

export default [
  <Route path="/words/new" component={Form} key='newWord'></Route>,
  <Route path="/words/:id" component={Card} key='word'></Route>,
  <Route path="/words" component={List} key='words'></Route>,
  <Route path="/words/edit/:id" component={Form} key='editWord'></Route>,
]