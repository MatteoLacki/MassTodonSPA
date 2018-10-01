import React, { Component } from "react";
import { Router } from "react-router-dom";
import createBrowserHistory from "history/createBrowserHistory";
import FullApp from "./containers/app";

const customHistory = createBrowserHistory();

class App extends Component {
  render() {
    return (
      <Router history={customHistory}>
        <FullApp />
      </Router>
    );
  }
}

export default App;
