import React from 'react';
import ReactDOM from 'react-dom';
import { configureStore } from './store/store';
import Root from './components/root';
import { domainToUnicode } from 'url';
import { fetchSearchGiphys } from './util/api_util';

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();

  //TESTING
  window.getState = store.getState();
  window.fetchSearchGiphys = fetchSearchGiphys;
  //TESTING

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});