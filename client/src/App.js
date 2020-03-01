import React from 'react'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom"
import { Words } from './routes'

function App() {
  return (
    <Router>
      <Switch>
        { Words }
        <Route path="/" component={Home}></Route>
      </Switch>
    </Router>
  );
}

function Home() {
  return (
    <Link to='/words'>words</Link>
  )
}

export default App;
