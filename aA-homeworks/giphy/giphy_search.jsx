import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';
import { domainToUnicode } from 'url';
//import { fetchSearchGiphys } from './util/api_util';
import { fetchSearchGiphys } from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  //TESTING
  //window.store = store; 
  //window.fetchSearchGiphys = fetchSearchGiphys;
  //window.receiveSearchGiphys = receiveSearchGiphys;
  //TESTING

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});