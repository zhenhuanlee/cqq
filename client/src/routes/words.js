import React from 'react'
import { Route } from 'react-router-dom'
import { List, Card } from '../components/words'

export default [
  <Route path="/words/:id" component={Card}></Route>,
  <Route path="/words" component={List}></Route>,
]