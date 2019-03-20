import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  render() {
    return {
      <form>
      
        <input type="submit" value="Search" onSubmit={this.handleSubmit}/>
      </form>
    };
  }
}

export default GiphysSearch;
