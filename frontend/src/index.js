import React from 'react'
import { render } from 'react-dom'
import { Provider } from 'react-redux'
import LayoutContainer from './containers/LayoutContainer'
import store from './store'

render(
  <Provider store={store}>
    <LayoutContainer />
  </Provider>,
  document.getElementById('root')
)
